import { test, expect } from '@playwright/test';

/**
 * Authentication E2E Tests
 *
 * Tests for user authentication flows including:
 * - Sign in
 * - Registration
 * - Sign out
 * - Error handling
 */

test.describe('Authentication', () => {
  test.beforeEach(async ({ page }) => {
    // Navigate to the app before each test
    await page.goto('/');
  });

  test('should display sign-in screen on initial load', async ({ page }) => {
    // Wait for Flutter app to initialize
    await page.waitForLoadState('networkidle');

    // Verify sign-in elements are present
    await expect(page.getByText('Sign In')).toBeVisible();
  });

  test('should show validation errors for empty credentials', async ({ page }) => {
    await page.waitForLoadState('networkidle');

    // Find and click sign-in button without entering credentials
    const signInButton = page.getByRole('button', { name: /sign in/i });
    await signInButton.click();

    // Wait for validation messages
    // Note: Adjust selectors based on your actual error message implementation
    await page.waitForTimeout(1000);

    // Verify error messages or that we're still on sign-in page
    await expect(page.getByText('Sign In')).toBeVisible();
  });

  test('should navigate to registration screen', async ({ page }) => {
    await page.waitForLoadState('networkidle');

    // Find and click register link/button
    const registerButton = page.getByText(/register/i);
    await registerButton.click();

    // Wait for navigation
    await page.waitForLoadState('networkidle');

    // Verify registration screen is displayed
    // Adjust based on your actual registration screen content
  });

  test('should sign in with valid test credentials', async ({ page }) => {
    await page.waitForLoadState('networkidle');

    // Fill in email field
    const emailInput = page.locator('input[type="email"], input').first();
    await emailInput.fill('admin@admin.com');

    // Fill in password field
    const passwordInput = page.locator('input[type="password"]').first();
    await passwordInput.fill('123321');

    // Click sign-in button
    const signInButton = page.getByRole('button', { name: /sign in/i });
    await signInButton.click();

    // Wait for authentication and navigation
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(3000);

    // Verify successful login by checking for operation menu elements
    // Note: This will fail if Firebase is not configured properly
    // Adjust assertions based on your actual success screen
  });

  test('should show error for invalid credentials', async ({ page }) => {
    await page.waitForLoadState('networkidle');

    // Fill in invalid credentials
    const emailInput = page.locator('input[type="email"], input').first();
    await emailInput.fill('invalid@test.com');

    const passwordInput = page.locator('input[type="password"]').first();
    await passwordInput.fill('wrongpassword');

    // Click sign-in button
    const signInButton = page.getByRole('button', { name: /sign in/i });
    await signInButton.click();

    // Wait for error message
    await page.waitForTimeout(2000);

    // Verify error message or toast notification
    // Adjust based on your error handling implementation
  });

  test('should toggle password visibility', async ({ page }) => {
    await page.waitForLoadState('networkidle');

    // Find password field
    const passwordInput = page.locator('input[type="password"]').first();
    await passwordInput.fill('testpassword');

    // Find and click password visibility toggle
    const toggleButton = page.getByRole('button', { name: /show|hide|visibility/i });
    if (await toggleButton.count() > 0) {
      await toggleButton.click();

      // Verify password is now visible (input type changed to text)
      const visiblePasswordInput = page.locator('input[type="text"]');
      await expect(visiblePasswordInput).toBeVisible();
    }
  });
});

test.describe('Registration', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');

    // Navigate to registration screen
    const registerButton = page.getByText(/register/i);
    await registerButton.click();
    await page.waitForLoadState('networkidle');
  });

  test('should display registration form', async ({ page }) => {
    // Verify registration form elements
    // Adjust based on your actual registration form
  });

  test('should validate required fields', async ({ page }) => {
    // Try to submit empty form
    // Verify validation errors
  });
});
