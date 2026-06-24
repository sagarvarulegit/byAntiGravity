import 'package:flutter/material.dart';
import '../theme.dart';

/// Displays the Jargon Pop-up Modal using showDialog with an NCERT-themed AlertDialog.
/// Callable from anywhere with positional parameters: showJargonModal(context, term, definition, example)
void showJargonModal(
  BuildContext context,
  String term,
  String definition,
  String example,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return JargonModal(
        term: term,
        definition: definition,
        example: example,
      );
    },
  );
}

/// Capitalized alias matching the exact naming in the requirement specification.
void ShowJargonModal(
  BuildContext context,
  String term,
  String definition,
  String example,
) => showJargonModal(context, term, definition, example);

/// Helper class to allow calling parseJargonMarkers(text) with an instance-provided BuildContext.
class JargonParser {
  final BuildContext context;

  JargonParser(this.context);

  /// Parse the text, detecting [JARGON: term | definition | example] markers
  /// and returning a list of InlineSpans.
  List<InlineSpan> parseJargonMarkers(String text) {
    return parseJargonMarkersWithContext(text, this.context);
  }
}

/// Helper method to detect [JARGON: term | definition | example] markers in text
/// and return a list of TextSpan and tappable WidgetSpan for jargon terms.
/// Tappable spans trigger the modal.
List<InlineSpan> parseJargonMarkers(String text, BuildContext context) {
  return parseJargonMarkersWithContext(text, context);
}

/// Core regex-based parsing implementation.
List<InlineSpan> parseJargonMarkersWithContext(String text, BuildContext context) {
  final List<InlineSpan> spans = [];
  final regex = RegExp(r'\[JARGON:\s*([^|\]]+)\s*\|\s*([^|\]]+)\s*\|\s*([^|\]]+)\s*\]');
  
  int lastMatchEnd = 0;
  for (final Match match in regex.allMatches(text)) {
    // Add any normal text preceding the jargon marker
    if (match.start > lastMatchEnd) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
    }
    
    final term = match.group(1)!.trim();
    final definition = match.group(2)!.trim();
    final example = match.group(3)!.trim();
    
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
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.bold,
                color: AppColors.purple, // NCERT Magenta (#BE185D)
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
    spans.add(TextSpan(text: text.substring(lastMatchEnd)));
  }
  
  return spans;
}

/// NCERT-themed dialog modal.
class JargonModal extends StatelessWidget {
  final String term;
  final String definition;
  final String example;

  const JargonModal({
    Key? key,
    required this.term,
    required this.definition,
    required this.example,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Cream background (#FAF9F6) in light mode, dark paper background (#0F172A) in dark mode
    final backgroundColor = isDark ? AppColors.bgDark : AppColors.bgLight;
    final textColor = isDark ? AppColors.textDarkPrimary : AppColors.textLightPrimary;
    final subTextColor = isDark ? AppColors.textDarkSecondary : AppColors.textLightSecondary;
    
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: AppColors.purple.withOpacity(0.2),
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Term Name + Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    term,
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.purple, // NCERT Magenta (#BE185D)
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  color: subTextColor,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                  tooltip: 'Close modal',
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Definition Section
            Text(
              definition,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 16,
                height: 1.5,
                color: textColor,
              ),
            ),
            
            // Example Section
            if (example.isNotEmpty) ...[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark 
                      ? AppColors.purpleDark.withOpacity(0.15) 
                      : AppColors.purpleLight.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.purple.withOpacity(0.25),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Real-World Example:",
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.5,
                        color: isDark ? AppColors.purpleLight : AppColors.purpleDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      example,
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontStyle: FontStyle.italic,
                        fontSize: 14.5,
                        height: 1.4,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/*
DEMO / USAGE EXAMPLE:
Integrating jargon pop-up modal with lessons_view.dart

1. Import the Jargon Modal widget in lessons_view.dart:
   import '../widgets/jargon_modal.dart';

2. In lessons_view.dart, update buildRichTextLine or add a conditional builder method:

   Widget buildJargonContent(String rawText, BuildContext context) {
     // If the text contains jargon markers [JARGON: term | definition | example]
     if (rawText.contains('[JARGON:')) {
       final List<InlineSpan> spans = parseJargonMarkers(rawText, context);
       return Text.rich(
         TextSpan(children: spans),
         style: const TextStyle(
           fontFamily: 'Georgia',
           fontSize: 15,
           height: 1.5,
         ),
       );
     }
     
     // Fallback to regular rich text formatting (bold / markdown)
     return buildRichTextLine(rawText, const TextStyle(fontFamily: 'Georgia', fontSize: 15));
   }

3. To manually trigger a jargon pop-up modal from any tap action, gesture, or button:
   
   ElevatedButton(
     onPressed: () {
       showJargonModal(
         context,
         "Ohm's Law",
         "The law stating that electric current is proportional to voltage and inversely proportional to resistance.",
         "If you double the voltage in a flashlight circuit while keeping resistance the same, the current doubles.",
       );
     },
     child: const Text("Show Ohm's Law Jargon"),
   );
*/
