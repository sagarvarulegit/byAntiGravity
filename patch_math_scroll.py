with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'r') as f:
    content = f.read()

# _buildFormulaCard contains:
#          Center(
#            child: Math.tex(
#              latex,
#              mathStyle: MathStyle.display,
#              textStyle: style,
#              onErrorFallback: (err) => Text(latex, style: style),
#            ),
#          ),

patch = """          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Math.tex(
                latex,
                mathStyle: MathStyle.display,
                textStyle: style,
                onErrorFallback: (err) => Text(latex, style: style),
              ),
            ),
          ),"""

content = content.replace(
    '          Center(\n            child: Math.tex(\n              latex,\n              mathStyle: MathStyle.display,\n              textStyle: style,\n              onErrorFallback: (err) => Text(latex, style: style),\n            ),\n          ),',
    patch
)

with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'w') as f:
    f.write(content)
