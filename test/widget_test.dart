import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/data/travel_data.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/widgets/star_rating.dart';
import 'package:travel_app/widgets/highlight_chip.dart';
import 'package:travel_app/widgets/info_row.dart';

void main() {

  // ── App Smoke Test ──────────────────────────────────────────────────────────
  group('App', () {
    testWidgets('launches and shows Home Screen', (WidgetTester tester) async {
      await tester.pumpWidget(const TravelApp());
      await tester.pump();

      expect(find.text('Explore the World'), findsOneWidget);
      expect(find.text('Popular Destinations'), findsOneWidget);
    });

    testWidgets('displays all category chips', (WidgetTester tester) async {
      await tester.pumpWidget(const TravelApp());
      await tester.pump();

      for (final category in kTravelCategories) {
        expect(find.text(category), findsWidgets);
      }
    });
  });

  // ── Destination Model ───────────────────────────────────────────────────────
  group('Destination model', () {
    test('defaults isFavorite to false', () {
      final dest = Destination(
        id: 'test',
        title: 'Test City',
        country: 'Testland',
        description: 'A test destination',
        longDescription: 'A longer test description for testing purposes.',
        price: 999,
        rating: 4.5,
        reviews: 100,
        imageUrl: 'https://example.com/image.jpg',
        category: 'City',
        highlights: ['Highlight 1', 'Highlight 2'],
      );

      expect(dest.isFavorite, isFalse);
    });

    test('isFavorite can be set to true', () {
      final dest = Destination(
        id: 'test2',
        title: 'Fave City',
        country: 'Faveland',
        description: 'A favorite destination',
        longDescription: 'A favorite destination with lots to see.',
        price: 1200,
        rating: 5.0,
        reviews: 500,
        imageUrl: 'https://example.com/fave.jpg',
        category: 'Beach',
        highlights: ['Beach', 'Sunset'],
        isFavorite: true,
      );

      expect(dest.isFavorite, isTrue);
    });

    test('hard-coded destinations list is not empty', () {
      expect(destinations, isNotEmpty);
    });

    test('all destinations have non-empty required fields', () {
      for (final d in destinations) {
        expect(d.id, isNotEmpty);
        expect(d.title, isNotEmpty);
        expect(d.country, isNotEmpty);
        expect(d.highlights, isNotEmpty);
        expect(d.price, greaterThan(0));
        expect(d.rating, inInclusiveRange(0.0, 5.0));
      }
    });
  });

  // ── StarRating Widget ───────────────────────────────────────────────────────
  group('StarRating widget', () {
    testWidgets('renders 5 star icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: StarRating(rating: 4.0))),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(4));
      expect(find.byIcon(Icons.star_border), findsOneWidget);
    });

    testWidgets('shows half star for .5 rating', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: StarRating(rating: 3.5))),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(3));
      expect(find.byIcon(Icons.star_half), findsOneWidget);
      expect(find.byIcon(Icons.star_border), findsOneWidget);
    });

    testWidgets('renders all filled stars for rating 5.0',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: StarRating(rating: 5.0))),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(5));
      expect(find.byIcon(Icons.star_border), findsNothing);
    });
  });

  // ── HighlightChip Widget ────────────────────────────────────────────────────
  group('HighlightChip widget', () {
    testWidgets('renders label text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HighlightChip(label: 'Oia Sunset')),
        ),
      );

      expect(find.text('Oia Sunset'), findsOneWidget);
    });

    testWidgets('renders check icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HighlightChip(label: 'Beach')),
        ),
      );

      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    });
  });

  // ── InfoRow Widget ──────────────────────────────────────────────────────────
  group('InfoRow widget', () {
    testWidgets('renders label and value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoRow(
              icon: Icons.calendar_today_outlined,
              label: 'Duration',
              value: '7 Days',
            ),
          ),
        ),
      );

      expect(find.text('Duration'), findsOneWidget);
      expect(find.text('7 Days'), findsOneWidget);
    });

    testWidgets('renders provided icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoRow(
              icon: Icons.people_outline,
              label: 'Group',
              value: 'Max 12',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.people_outline), findsOneWidget);
    });
  });
}