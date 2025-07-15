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

  group('StorageInfo', () {
    setUp(() {
      StorageInfoPlatform.instance = MockStorageInfoPlatform();
    });

    test('getStorageInfo returns correct data on a supported platform',
        () async {
      final storageInfo = StorageInfo(isSupportedPlatform: () => true);
      final result = await storageInfo.getStorageInfo();

      expect(result.totalBytes, 1000);
      expect(result.freeBytes, 500);
      expect(result.usedBytes, 500);
    });

    test('getStorageInfo throws on an unsupported platform', () async {
      final storageInfo = StorageInfo(isSupportedPlatform: () => false);

      try {
        await storageInfo.getStorageInfo();
        fail('Expected an UnsupportedError to be thrown.');
        // Expected an UnsupportedError to be thrown.
        // ignore: avoid_catching_errors
      } on UnsupportedError catch (e) {
        expect(e, isA<UnsupportedError>());
      }
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
