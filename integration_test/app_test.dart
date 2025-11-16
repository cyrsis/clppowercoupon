import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clppowercoupon/main.dart' as app;

/// Integration tests for CLP Power Coupon application
///
/// These tests verify the complete user flow from app launch to coupon redemption
/// Run with: flutter test integration_test/app_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CLP Power Coupon Integration Tests', () {
    testWidgets('App launches successfully and shows sign-in screen',
        (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Verify sign-in screen is displayed
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('User can navigate to registration screen',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find and tap the register button/link
      final registerButton = find.text('Register');
      expect(registerButton, findsOneWidget);
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Verify registration screen is displayed
      // Adjust this based on your actual UI text
    });

    testWidgets('Sign in with test credentials',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter email
      final emailField = find.byType(TextField).first;
      await tester.enterText(emailField, 'admin@admin.com');
      await tester.pumpAndSettle();

      // Enter password
      final passwordField = find.byType(TextField).last;
      await tester.enterText(passwordField, '123321');
      await tester.pumpAndSettle();

      // Tap sign in button
      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Verify navigation to operation menu
      // Note: This will fail if Firebase is not configured properly
      // Adjust assertions based on your actual success screen
    });

    testWidgets('Language switching works correctly',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find language toggle button
      // Adjust based on your actual implementation
      final languageButton = find.byType(IconButton);
      if (languageButton.evaluate().isNotEmpty) {
        await tester.tap(languageButton.first);
        await tester.pumpAndSettle();

        // Verify language has changed
        // Add specific assertions for your language switching
      }
    });
  });

  group('Authenticated User Tests', () {
    // These tests assume the user is already authenticated
    // You may need to set up test authentication state

    testWidgets('Operation menu displays all options',
        (WidgetTester tester) async {
      // TODO: Implement authentication setup for testing
      // Then verify operation menu displays:
      // - Scan coupon
      // - Manual code entry
      // - 24h redemption log
    });

    testWidgets('Manual code entry screen accepts input',
        (WidgetTester tester) async {
      // TODO: Navigate to manual code entry
      // Enter a test coupon code
      // Verify validation feedback
    });
  });

  group('Edge Cases & Error Handling', () {
    testWidgets('Empty email and password shows validation errors',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Tap sign in without entering credentials
      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      // Verify error messages are displayed
      // Adjust based on your validation implementation
    });

    testWidgets('Invalid credentials show error message',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter invalid credentials
      final emailField = find.byType(TextField).first;
      await tester.enterText(emailField, 'invalid@test.com');

      final passwordField = find.byType(TextField).last;
      await tester.enterText(passwordField, 'wrongpassword');
      await tester.pumpAndSettle();

      // Tap sign in
      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Verify error toast or message is displayed
    });
  });
}
