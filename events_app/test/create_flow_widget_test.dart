import 'dart:async';

import 'package:events_app/data/event_repository.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/screens/home_screen.dart';
import 'package:events_app/theme/champagne_theme.dart';
import 'package:events_app/widgets/event_masthead.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('create flow navigates to dashboard',
      (WidgetTester tester) async {
    final repository = _InMemoryEventRepository();

    await tester.pumpWidget(
      MaterialApp(
        theme: buildChampagneTheme(Brightness.light),
        home: HomeScreen(repository: repository),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Sofia & Miguel');
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.byType(EventMasthead), findsOneWidget);
    expect(find.text('Checklist'), findsOneWidget);
  });
}

class _InMemoryEventRepository implements EventRepository {
  final _events = <Event>[];
  final _controller = StreamController<List<Event>>.broadcast();

  @override
  Future<void> close() async {
    await _controller.close();
  }

  @override
  Future<void> delete(String id) async {
    _events.removeWhere((event) => event.id == id);
    _controller.add(List<Event>.from(_events));
  }

  @override
  Future<Event?> getById(String id) async {
    for (final event in _events) {
      if (event.id == id) {
        return event;
      }
    }
    return null;
  }

  @override
  Future<List<Event>> getEvents() async => List<Event>.from(_events);

  @override
  Future<Event> save(Event event) async {
    final index = _events.indexWhere((item) => item.id == event.id);
    if (index == -1) {
      _events.add(event);
    } else {
      _events[index] = event;
    }
    _controller.add(List<Event>.from(_events));
    return event;
  }

  @override
  Stream<List<Event>> watchEvents() async* {
    yield List<Event>.from(_events);
    yield* _controller.stream;
  }
}
