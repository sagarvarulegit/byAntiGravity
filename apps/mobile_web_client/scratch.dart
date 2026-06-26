import 'dart:core';

void main() {
  var line = "👦 **Student:** Phew, that was a lot of formulas!";
  final match = RegExp(r'^(.*?)\*\*(.*?):\*\*\s*(.*)$').firstMatch(line);
  if (match != null) {
    print("G1: ${match.group(1)}");
    print("G2: ${match.group(2)}");
    print("G3: ${match.group(3)}");
  }
}
