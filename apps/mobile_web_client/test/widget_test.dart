// CBSE Class 10 Learning Portal Widget Tests
// CBSE Class 10 Learning Portal Widget Tests
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_web_client/main.dart';
import 'package:mobile_web_client/views/auth_view.dart';

void main() {
  testWidgets('Authentication View loads and toggles to Sign Up', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CBSEPortalApp());
    await tester.pump(const Duration(milliseconds: 200));

    // Verify that the login page branding loads
    expect(find.text('CBSE Core Class 10'), findsOneWidget);
    expect(find.text('Sign In to Your Account'), findsOneWidget);

    // Find and tap the link to switch to registration
    final signUpLink = find.text('Create an account');
    expect(signUpLink, findsOneWidget);
    await tester.ensureVisible(signUpLink);
    await tester.tap(signUpLink);
    await tester.pump(const Duration(milliseconds: 500)); // Wait for tab switch animation to settle

    // Verify that the UI switches to registration mode
    expect(find.text('Create Your Student Profile'), findsOneWidget);
  });
}
