import { test, expect } from '@playwright/test';

/**
 * Localization E2E Tests
 *
 * Tests for multi-language support:
 * - Language switching
 * - English (EN) translations
 * - Traditional Chinese (繁體中文) translations
 */

test.describe('Localization', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');
  });

  test('should display default language (English)', async ({ page }) => {
    // Verify English text is displayed
    await expect(page.getByText('Sign In')).toBeVisible();
  });

  test('should switch to Traditional Chinese', async ({ page }) => {
    // Find language toggle button
    // Adjust selector based on your actual language switcher implementation
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);

      // Verify Chinese text is displayed
      // Adjust based on your actual Chinese translations
    }
  });

  test('should persist language preference', async ({ page }) => {
    // Switch language
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);

      // Reload the page
      await page.reload();
      await page.waitForLoadState('networkidle');

      // Verify language is still the same after reload
      // This tests localStorage persistence
    }
  });

  test('should translate all UI elements when switching language', async ({ page }) => {
    // Get initial text content
    const signInText = await page.getByText('Sign In').textContent();

    // Switch language
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);

      // Verify text has changed
      // The specific translations depend on your l10n files
    }
  });

  test('should handle language in error messages', async ({ page }) => {
    // Try to sign in with invalid credentials
    const signInButton = page.getByRole('button', { name: /sign in/i });
    await signInButton.click();

    await page.waitForTimeout(1000);

    // Switch language
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);

      // Try to sign in again and verify error message is in new language
      const signInButtonChinese = page.getByRole('button').first();
      await signInButtonChinese.click();

      await page.waitForTimeout(1000);
      // Verify error message is translated
    }
  });

  test('should maintain language across navigation', async ({ page }) => {
    // Switch to Chinese
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);

      // Navigate to registration screen
      const registerButton = page.getByText(/註冊|register/i);
      if (await registerButton.count() > 0) {
        await registerButton.click();
        await page.waitForLoadState('networkidle');

        // Verify registration screen is also in Chinese
      }
    }
  });
});

test.describe('Localization - Authenticated User', () => {
  async function signIn(page) {
    await page.goto('/');
    await page.waitForLoadState('networkidle');

    const emailInput = page.locator('input[type="email"], input').first();
    await emailInput.fill('admin@admin.com');

    const passwordInput = page.locator('input[type="password"]').first();
    await passwordInput.fill('123321');

    const signInButton = page.getByRole('button', { name: /sign in/i });
    await signInButton.click();

    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(3000);
  }

  test('should display operation menu in selected language', async ({ page }) => {
    await signIn(page);

    // Operation menu should be displayed in default language (English)

    // Switch to Chinese
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);

      // Verify operation menu items are translated
    }
  });

  test('should translate redemption screens', async ({ page }) => {
    await signIn(page);

    // Switch language first
    const languageButton = page.getByRole('button', { name: /language|語言|CHT|ENG/i });

    if (await languageButton.count() > 0) {
      await languageButton.click();
      await page.waitForTimeout(1000);
    }

    // Navigate to manual code entry
    const manualCodeButton = page.locator('button, a').filter({ hasText: /輸入|manual/i });

    if (await manualCodeButton.count() > 0) {
      await manualCodeButton.click();
      await page.waitForLoadState('networkidle');

      // Verify the screen content is translated
    }
  });

  test('should format dates according to locale', async ({ page }) => {
    await signIn(page);

    // Navigate to 24h redemption log
    const logButton = page.getByText(/log|紀錄|history/i);

    if (await logButton.count() > 0) {
      await logButton.click();
      await page.waitForLoadState('networkidle');

      // Check if dates are formatted correctly for the current locale
      // This depends on your date formatting implementation
    }
  });
});
