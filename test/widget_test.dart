import 'package:flutter_test/flutter_test.dart';
import 'package:movie_library/main.dart';

void main() {
  testWidgets('Movie Library app displays its title',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MovieLibraryApp());

    expect(find.text('Movie Library'), findsOneWidget);
  });
}