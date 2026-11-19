import 'package:flutter_test/flutter_test.dart';
import 'package:uts_pemrograman_mobile_2/main.dart';
import 'package:uts_pemrograman_mobile_2/screens/splash_screen.dart';

void main() {
  testWidgets('App loads SplashScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const UtsMobileApp());
    await tester.pump();

    expect(find.byType(SplashScreen), findsOneWidget);
  });
}