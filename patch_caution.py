with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'r') as f:
    content = f.read()

import re

# We want to catch *Caution: ... anywhere.
# In _parseMarkdownNotes, let's look for how to inject a custom caution box.
# Right before `if (line.startsWith('### Activity')) {`, we can add a check for *Caution:
patch = """
      if (line.startsWith('*Caution:') || (line.startsWith('*') && line.toLowerCase().contains('caution'))) {
        var cautionText = line.replaceAll('*', '').trim();
        if (cautionText.toLowerCase().startsWith('caution:')) {
          cautionText = cautionText.substring(8).trim();
        }
        children.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.orange.withValues(alpha: 0.1) : Colors.orange.shade50,
              border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('COMMON PITFALL', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 4),
                      Text(cautionText, style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, height: 1.5, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          )
        );
        continue;
      }

      if (line.startsWith('### Activity')) {"""

content = content.replace("      if (line.startsWith('### Activity')) {", patch)

with open('apps/mobile_web_client/lib/views/lessons_view.dart', 'w') as f:
    f.write(content)
