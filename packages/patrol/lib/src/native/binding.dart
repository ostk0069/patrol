import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class _Response {
  factory _Response.fromJson(Map<String, dynamic> json) {
    return _Response._(
      int.parse(json['request_id'] as String),
      json['status'] == 'true',
    );
  }

  const _Response._(this.id, this.ok);

  final int id;
  final bool ok;
}

// ignore: avoid_print
void _defaultPrintLogger(String message) => print('PatrolBinding: $message');

/// Binding that enables some of Patrol's custom functionality, such as tapping
/// on WebViews during a test.
class PatrolBinding extends IntegrationTestWidgetsFlutterBinding {
  /// Default constructor that only calls the superclass constructor.
  PatrolBinding() : super();

  /// Returns an instance of the [PatrolBinding], creating and initializing it
  /// if necessary.
  factory PatrolBinding.ensureInitialized() {
    if (_instance == null) {
      PatrolBinding();
    }
    return _instance!;
  }

  final _logger = _defaultPrintLogger;

  int _latestEventId = 0;

  final _controller = StreamController<_Response>.broadcast();

  // TODO: Remove once https://github.com/flutter/flutter/pull/108430 is
  // available on the stable channel
  @override
  TestBindingEventSource get pointerEventSource => TestBindingEventSource.test;

  @override
  void initInstances() {
    super.initInstances();
    _instance = this;

    if (!extensionStreamHasListener) {
      _logger("Extension stream has no listeners, so host features won't work");
    }
  }

  @override
  void initServiceExtensions() {
    super.initServiceExtensions();

    if (!kReleaseMode) {
      registerServiceExtension(
        name: 'patrol',
        callback: (args) async {
          _controller.add(_Response.fromJson(args));
          return <String, String>{};
        },
      );
      _logger('registered service extension ext.flutter.patrol');
    }
  }

  /// Takes a screenshot using the `flutter screenshot` command.
  ///
  /// The screenshot is placed in [path], named [name], and has .png extension.
  Future<void> takeFlutterScreenshot({
    required String name,
    required String path,
  }) async {
    final eventId = ++_latestEventId;

    postEvent('patrol', <String, dynamic>{
      'method': 'take_screenshot',
      'request_id': eventId,
      'args': {'name': name, 'path': path}
    });

    final resp = await _controller.stream.firstWhere((r) => r.id == eventId);
    if (!resp.ok) {
      throw StateError('event with request_id $eventId failed');
    }
  }

  /// The singleton instance of this object.
  ///
  /// Provides access to the features exposed by this class. The binding must be
  /// initialized before using this getter; this is typically done by calling
  /// [PatrolBinding.ensureInitialized].
  static PatrolBinding get instance => BindingBase.checkInstance(_instance);
  static PatrolBinding? _instance;
}
