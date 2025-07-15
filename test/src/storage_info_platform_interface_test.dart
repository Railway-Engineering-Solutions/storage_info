import 'package:flutter_test/flutter_test.dart';
import 'package:storage_info/src/storage_info_platform_interface.dart';

class TestStorageInfoPlatform extends StorageInfoPlatform {}

void main() {
  group('StorageInfoPlatform', () {
    test('getStorageInfo throws UnimplementedError', () {
      final storageInfoPlatform = TestStorageInfoPlatform();

      expect(
        storageInfoPlatform.getStorageInfo,
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
