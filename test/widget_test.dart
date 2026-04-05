import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:nonqueue_app/main.dart';

void main() {
  testWidgets('App builds without throwing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
