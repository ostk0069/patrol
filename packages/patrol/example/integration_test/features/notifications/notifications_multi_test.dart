@Tags(['android', 'ios'])

import 'dart:io';

import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../config.dart';

void main() {
  patrolTest(
    'send 2 notifications, verifies that they are visible and taps on them',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      await $.pumpWidgetAndSettle(ExampleApp());

      await $('Open notifications screen').tap();
      await $(RegExp('someone liked')).tap(); // appears on top

      if (await $.native.isPermissionDialogVisible()) {
        print('Dialog is visible');
        await $.native.grantPermissionWhenInUse();
      }

      await $(RegExp('special offer')).tap(); // also appears on top

      if (Platform.isIOS) {
        await $.native.closeHeadsUpNotification();
      }

      await $.native.openNotifications();
      final notifications = await $.native.getNotifications();
      $.log('Found ${notifications.length} notifications');
      notifications.forEach($.log);

      expect(notifications.length, isNonZero);
      await $.native.tapOnNotificationByIndex(1);

      await $.native.openNotifications();
      await $.native.tapOnNotificationBySelector(
        Selector(textContains: 'Special offer'),
      );
    },
  );
}
