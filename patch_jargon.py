with open('apps/mobile_web_client/lib/widgets/jargon_modal.dart', 'r') as f:
    content = f.read()

import re

# Update parseJargonMarkers
content = re.sub(
    r'List<InlineSpan> parseJargonMarkers\(String text, BuildContext context\) \{',
    r'List<InlineSpan> parseJargonMarkers(String text, BuildContext context, [TextStyle? style]) {',
    content
)
content = re.sub(
    r'return parseJargonMarkersWithContext\(text, context\);',
    r'return parseJargonMarkersWithContext(text, context, style);',
    content
)

# Update parseJargonMarkersWithContext
patch = """List<InlineSpan> parseJargonMarkersWithContext(String text, BuildContext context, [TextStyle? style]) {
  final List<InlineSpan> spans = [];
  // Match 2 or 3 parts: [JARGON: term | definition] OR [JARGON: term | definition | example]
  final regex = RegExp(r'\\[JARGON:\\s*([^|\\]]+)\\s*\\|\\s*([^|\\]]+)(?:\\s*\\|\\s*([^|\\]]+))?\\s*\\]');
  
  int lastMatchEnd = 0;
  for (final Match match in regex.allMatches(text)) {
    // Add any normal text preceding the jargon marker
    if (match.start > lastMatchEnd) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start), style: style));
    }
    
    final term = match.group(1)!.trim();
    final definition = match.group(2)!.trim();
    final example = match.groupCount >= 3 && match.group(3) != null ? match.group(3)!.trim() : "";
    
    // Add the tappable widget span for the jargon term
    spans.add(
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: GestureDetector(
          onTap: () => showJargonModal(context, term, definition, example),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              term,
              style: (style ?? const TextStyle()).copyWith(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.purple,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
          ),
        ),
      ),
    );
    
    lastMatchEnd = match.end;
  }
  
  // Add any remaining normal text
  if (lastMatchEnd < text.length) {
    spans.add(TextSpan(text: text.substring(lastMatchEnd), style: style));
  }
  
  return spans;
}"""

content = re.sub(r'List<InlineSpan> parseJargonMarkersWithContext\(String text, BuildContext context\) \{.*?return spans;\n\}', patch, content, flags=re.DOTALL)

with open('apps/mobile_web_client/lib/widgets/jargon_modal.dart', 'w') as f:
    f.write(content)
