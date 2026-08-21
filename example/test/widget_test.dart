import 'package:flutter_test/flutter_test.dart';
import 'package:storage_info_example/main.dart';

void main() {
  testWidgets('shows the storage info example', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Storage Info Example'), findsOneWidget);
    expect(find.byType(StorageInfoPage), findsOneWidget);
  });
}
