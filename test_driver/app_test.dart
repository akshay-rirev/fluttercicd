import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  final splashSignInButton = find.byValueKey('splash_sign_in_button');
  final screenSignInButton = find.byValueKey('screen_sign_in_button');
  final mobileField = find.byValueKey('mobile_field');
  final otpField = find.byValueKey('otp_field');

  FlutterDriver driver;

  Future<bool> waitUntilPresent(
    SerializableFinder byValueKey, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    try {
      await driver.waitFor(byValueKey, timeout: timeout);
      return true;
    } catch (exception) {
      return false;
    }
  }

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDown(() {
    if (driver != null) {
      driver.close();
    }
  });

  test('SignInTest', () async {
    if (await waitUntilPresent(splashSignInButton)) {
      await driver.tap(splashSignInButton);
    }
    await driver.waitFor(mobileField);
    await driver.tap(mobileField);
    await driver.enterText('9999999999');
    await driver.tap(screenSignInButton);
    await driver.waitFor(otpField);
    await driver.tap(otpField);
    await driver.enterText('111111');
  });
}
