import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_info/src/storage_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MethodChannelStorageInfo', () {
    late MethodChannelStorageInfo methodChannelStorageInfo;

    setUp(() {
      methodChannelStorageInfo = MethodChannelStorageInfo();
    });

    test('getStorageInfo returns correct data', () async {
      const totalBytes = 1000;
      const freeBytes = 500;

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelStorageInfo.methodChannel,
        (MethodCall methodCall) async {
          if (methodCall.method == 'getStorageInfo') {
            return <String, dynamic>{
              'totalBytes': totalBytes,
              'freeBytes': freeBytes,
            };
          }
          return null;
        },
      );

      final result = await methodChannelStorageInfo.getStorageInfo();

      expect(result.totalBytes, totalBytes);
      expect(result.freeBytes, freeBytes);
      expect(result.usedBytes, totalBytes - freeBytes);
    });

    test('getStorageInfo throws PlatformException on null result', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelStorageInfo.methodChannel,
        (MethodCall methodCall) async {
          if (methodCall.method == 'getStorageInfo') {
            return null;
          }
          return null;
        },
      );

      expect(
        methodChannelStorageInfo.getStorageInfo(),
        throwsA(isA<PlatformException>()),
      );
    });
  });
}
