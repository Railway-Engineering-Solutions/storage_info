import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_info/src/storage_info.dart';
import 'package:storage_info/src/storage_info_platform_interface.dart';

class MockStorageInfoPlatform extends StorageInfoPlatform {
  @override
  Future<StorageInfoData> getStorageInfo() async {
    const totalBytes = 1000;
    const freeBytes = 500;
    const usedBytes = 500;
    return const StorageInfoData(
      totalBytes: totalBytes,
      freeBytes: freeBytes,
      usedBytes: usedBytes,
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    StorageInfoPlatform.instance = MockStorageInfoPlatform();
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  group('StorageInfo', () {
    test(
      'getStorageInfo returns correct data on a supported platform',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        final result = await const StorageInfo().getStorageInfo();

        expect(result.totalBytes, 1000);
        expect(result.freeBytes, 500);
        expect(result.usedBytes, 500);
      },
    );

    test('getStorageInfo throws on an unsupported platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;

      expect(
        () => const StorageInfo().getStorageInfo(),
        throwsUnsupportedError,
      );
    });

    test('getStorageInfo returns correct data on a supported platform '
        '(no injection)', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      const storageInfo = StorageInfo();
      final result = await storageInfo.getStorageInfo();

      expect(result.totalBytes, 1000);
      expect(result.freeBytes, 500);
      expect(result.usedBytes, 500);
    });

    test('usedPercentage returns correct value', () {
      const data = StorageInfoData(
        totalBytes: 1000,
        freeBytes: 500,
        usedBytes: 500,
      );
      expect(data.usedPercentage, 0.5);
    });

    test('freePercentage returns correct value', () {
      const data = StorageInfoData(
        totalBytes: 1000,
        freeBytes: 500,
        usedBytes: 500,
      );
      expect(data.freePercentage, 0.5);
    });
  });
}
