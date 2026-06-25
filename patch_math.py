with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'r') as f:
    content = f.read()

patch = """  Widget _buildMathText(String text, [TextStyle? style]) {
    final displayParts = text.split('$$');
    if (displayParts.length == 1) {
      return _buildInlineMathText(displayParts[0], style);
    }

    final List<Widget> children = [];
    for (int i = 0; i < displayParts.length; i++) {
      final part = displayParts[i];
      if (i % 2 == 1) {
        // Display math → render inside a Formula Card
        children.add(_buildFormulaCard(part, style));
      } else {
        if (part.isNotEmpty) {
          children.add(_buildInlineMathText(part, style));
        }
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }"""

import re
content = re.sub(r'  Widget _buildMathText\(String text, \[TextStyle\? style\]\) \{.*?    \);\n  \}', patch, content, flags=re.DOTALL)

with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'w') as f:
    f.write(content)
