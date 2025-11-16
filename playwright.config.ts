import { defineConfig, devices } from '@playwright/test';

/**
 * Playwright Configuration for CLP Power Coupon E2E Tests
 *
 * This configuration sets up end-to-end testing for the Flutter web application.
 * Tests run against the local development server or deployed Firebase hosting.
 *
 * @see https://playwright.dev/docs/test-configuration
 */
export default defineConfig({
  // Test directory
  testDir: './e2e/tests',

  // Maximum time one test can run
  timeout: 30 * 1000,

  // Test execution settings
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,

  // Reporter configuration
  reporter: [
    ['html', { outputFolder: 'e2e/test-results/html' }],
    ['json', { outputFile: 'e2e/test-results/results.json' }],
    ['list']
  ],

  // Shared settings for all projects
  use: {
    // Base URL for the application
    baseURL: process.env.BASE_URL || 'http://localhost:8080',

    // Collect trace on first retry
    trace: 'on-first-retry',

    // Screenshot on failure
    screenshot: 'only-on-failure',

    // Video on retry
    video: 'retain-on-failure',

    // Action timeout
    actionTimeout: 10 * 1000,

    // Navigation timeout
    navigationTimeout: 30 * 1000,
  },

  // Configure projects for different browsers
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },

    {
      name: 'firefox',
      use: { ...devices['Desktop Firefox'] },
    },

    {
      name: 'webkit',
      use: { ...devices['Desktop Safari'] },
    },

    // Mobile browsers
    {
      name: 'Mobile Chrome',
      use: { ...devices['Pixel 5'] },
    },

    {
      name: 'Mobile Safari',
      use: { ...devices['iPhone 12'] },
    },

    // Tablet
    {
      name: 'iPad',
      use: { ...devices['iPad Pro'] },
    },
  ],

  // Run local dev server before starting tests (optional)
  webServer: process.env.CI ? undefined : {
    command: 'flutter run -d web-server --web-port=8080 --web-hostname=localhost',
    port: 8080,
    timeout: 120 * 1000,
    reuseExistingServer: !process.env.CI,
  },
});
