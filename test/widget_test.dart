import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('BMI Calculator test', (WidgetTester tester) async {
    await tester.pumpWidget(const BMICalculator());

    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Height'), findsOneWidget);
    expect(find.text('Weight'), findsOneWidget);
    expect(find.text('Age'), findsOneWidget);
  });
}