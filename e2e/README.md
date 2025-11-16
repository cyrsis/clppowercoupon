# End-to-End Testing with Playwright

This directory contains E2E (End-to-End) tests for the CLP Power Coupon web application using Playwright.

## Overview

Playwright is a modern E2E testing framework that provides:
- Cross-browser testing (Chromium, Firefox, WebKit)
- Mobile browser emulation
- Automatic waiting and retry logic
- Powerful selectors and assertions
- Screenshots and video recording on failure
- Trace viewer for debugging

## Directory Structure

```
e2e/
├── tests/
│   ├── auth.spec.ts              # Authentication flow tests
│   ├── coupon-redemption.spec.ts # Coupon redemption tests
│   └── localization.spec.ts      # Multi-language tests
├── test-results/                  # Test results and reports (gitignored)
└── README.md                      # This file
```

## Prerequisites

1. **Node.js** (18.0.0 or higher)
2. **npm** (9.0.0 or higher)
3. **Playwright browsers** installed

## Installation

1. Install Node.js dependencies:
   ```bash
   npm install
   ```

2. Install Playwright browsers:
   ```bash
   npm run install:playwright
   ```

   Or directly:
   ```bash
   npx playwright install
   ```

## Running Tests

### All Tests

Run all E2E tests in headless mode:
```bash
npm run test:e2e
```

### Headed Mode

Run tests with visible browser windows:
```bash
npm run test:e2e:headed
```

### UI Mode

Interactive test runner with time travel debugging:
```bash
npm run test:e2e:ui
```

### Debug Mode

Run tests in debug mode with Playwright Inspector:
```bash
npm run test:e2e:debug
```

### Specific Test File

Run a specific test file:
```bash
npx playwright test e2e/tests/auth.spec.ts
```

### Specific Browser

Run tests on a specific browser:
```bash
npx playwright test --project=chromium
npx playwright test --project=firefox
npx playwright test --project=webkit
```

### Mobile Testing

Run tests on mobile browser emulation:
```bash
npx playwright test --project="Mobile Chrome"
npx playwright test --project="Mobile Safari"
```

## Test Reports

### View HTML Report

After running tests, view the HTML report:
```bash
npm run test:e2e:report
```

### Test Results Location

- HTML Report: `e2e/test-results/html/`
- JSON Results: `e2e/test-results/results.json`
- Screenshots: `e2e/test-results/` (on failure)
- Videos: `e2e/test-results/` (on failure/retry)

## Writing Tests

### Test Structure

```typescript
import { test, expect } from '@playwright/test';

test.describe('Feature Name', () => {
  test.beforeEach(async ({ page }) => {
    // Setup before each test
    await page.goto('/');
  });

  test('should do something', async ({ page }) => {
    // Test implementation
    await page.click('button');
    await expect(page.locator('h1')).toHaveText('Expected Text');
  });
});
```

### Helper Functions

Create reusable helper functions for common operations:

```typescript
async function signIn(page) {
  await page.goto('/');
  await page.fill('input[type="email"]', 'admin@admin.com');
  await page.fill('input[type="password"]', '123321');
  await page.click('button[type="submit"]');
  await page.waitForLoadState('networkidle');
}
```

### Best Practices

1. **Use Semantic Selectors**: Prefer `getByRole`, `getByText`, `getByLabel` over CSS selectors
2. **Wait for State**: Use `waitForLoadState('networkidle')` for Flutter apps
3. **Assertions**: Always use `expect()` for assertions, not `if` statements
4. **Isolation**: Each test should be independent and not rely on other tests
5. **Cleanup**: Use `beforeEach` and `afterEach` for setup and cleanup
6. **Timeout**: Increase timeout for slow operations like Firebase authentication

## Configuration

Test configuration is in `playwright.config.ts` at the project root.

### Key Settings

- **baseURL**: Set via `BASE_URL` environment variable (default: http://localhost:8080)
- **timeout**: 30 seconds per test
- **retries**: 2 retries in CI, 0 locally
- **workers**: Parallel workers (1 in CI, auto locally)

### Environment Variables

```bash
# Use deployed Firebase URL instead of localhost
BASE_URL=https://clppowercoupon.web.app npm run test:e2e

# Run in CI mode
CI=true npm run test:e2e
```

## Test Coverage

### Current Test Suites

1. **Authentication Tests** (`auth.spec.ts`)
   - Sign-in flow
   - Registration
   - Validation errors
   - Password visibility toggle

2. **Coupon Redemption Tests** (`coupon-redemption.spec.ts`)
   - Manual code entry
   - Code validation
   - Redemption history
   - CSV export
   - Error handling

3. **Localization Tests** (`localization.spec.ts`)
   - Language switching
   - Translation verification
   - Locale persistence
   - Multi-language navigation

### Adding New Tests

1. Create a new test file in `e2e/tests/`:
   ```bash
   touch e2e/tests/new-feature.spec.ts
   ```

2. Follow the existing test structure
3. Run the new tests to verify they work
4. Update this README if needed

## Generating Tests

Use Playwright Codegen to generate tests by recording browser interactions:

```bash
npm run test:e2e:codegen
```

This will open a browser where you can interact with the app. Playwright will generate test code based on your actions.

## CI/CD Integration

### GitHub Actions Example

```yaml
- name: Install dependencies
  run: npm ci

- name: Install Playwright browsers
  run: npx playwright install --with-deps

- name: Run E2E tests
  run: npm run test:e2e
  env:
    CI: true

- name: Upload test results
  if: always()
  uses: actions/upload-artifact@v3
  with:
    name: playwright-report
    path: e2e/test-results/
```

## Troubleshooting

### Tests are Flaky

1. Increase timeouts in `playwright.config.ts`
2. Add explicit waits: `await page.waitForSelector('selector')`
3. Use `waitForLoadState('networkidle')` for Flutter apps
4. Check for race conditions

### Cannot Find Elements

1. Wait for app to load: `await page.waitForLoadState('networkidle')`
2. Use Playwright Inspector to debug selectors
3. Flutter apps may need longer wait times
4. Check if element is in a different frame or shadow DOM

### Browser Not Launching

1. Reinstall browsers: `npx playwright install --with-deps`
2. Check system dependencies
3. Try headless mode first
4. Review error messages for missing dependencies

### Firebase Connection Issues

1. Verify Firebase configuration in `web/index.html`
2. Check network connectivity
3. Ensure Firebase project is active
4. Review browser console for errors

## Resources

- [Playwright Documentation](https://playwright.dev/docs/intro)
- [Playwright API Reference](https://playwright.dev/docs/api/class-playwright)
- [Best Practices](https://playwright.dev/docs/best-practices)
- [Debugging Tests](https://playwright.dev/docs/debug)
- [Test Reporters](https://playwright.dev/docs/test-reporters)

## Support

For issues or questions:
- Create an issue in the repository
- Contact: victor@budgetapp.works
- Review existing test files for examples
