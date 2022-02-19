import { test, expect } from '@playwright/test';

test.beforeEach(() => {
  console.log('Environment:', process.env.E2E_ENVIRONMENT);
});
test('basic test', async ({ page }) => {
  await page.goto('https://playwright.dev/');

  const title = page.locator('.navbar__inner .navbar__title');
  await expect(title).toHaveText('Playwright');
});
