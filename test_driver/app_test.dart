import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  final addItem = find.byValueKey('AddItem');
  final clearItem = find.byValueKey('ClearItem');

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

  test('AddAndClearItemTest', () async {
    await waitUntilPresent(addItem);

    // Add an Item
    await driver.tap(addItem);
    await driver.tap(addItem);
    await driver.tap(addItem);

    // Clear Items
    await driver.tap(clearItem);
  });
}
