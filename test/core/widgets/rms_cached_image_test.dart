import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waiter_portal/core/widgets/rms_cached_image.dart';

void main() {
  group('RmsCachedImage Unit and Widget Tests', () {
    testWidgets('renders custom errorWidget immediately when imageUrl is null',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RmsCachedImage(
              imageUrl: null,
              errorWidget: Text('Fallback Error View'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Fallback Error View'), findsOneWidget);
    });

    testWidgets('renders custom errorWidget immediately when imageUrl is empty',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RmsCachedImage(
              imageUrl: '   ',
              errorWidget: Text('Fallback Error View'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Fallback Error View'), findsOneWidget);
    });

    testWidgets('renders custom errorWidget immediately when URL has no HTTP scheme',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RmsCachedImage(
              imageUrl: 'invalid_image_path.jpg',
              errorWidget: Text('Invalid Scheme Error'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Invalid Scheme Error'), findsOneWidget);
    });

    testWidgets('renders default broken image icon when errorWidget is omitted for null URL',
        (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RmsCachedImage(
              imageUrl: null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
    });

    testWidgets('applies ClipRRect when borderRadius is specified',
        (WidgetTester tester) async {
      const testRadius = BorderRadius.all(Radius.circular(16));

      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RmsCachedImage(
              imageUrl: null,
              borderRadius: testRadius,
            ),
          ),
        ),
      );

      // Assert
      final clipFinder = find.byType(ClipRRect);
      expect(clipFinder, findsOneWidget);

      final clipWidget = tester.widget<ClipRRect>(clipFinder);
      expect(clipWidget.borderRadius, equals(testRadius));
    });
  });
}

