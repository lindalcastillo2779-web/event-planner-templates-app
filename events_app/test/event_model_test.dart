import 'package:events_app/models/event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('event copyWith keeps id and updates changed fields', () {
    final event = Event.create(
      name: 'Sofia & Miguel',
      eventType: EventType.wedding,
      tradition: Tradition.catholic,
    );

    final updated = event.copyWith(name: 'Sofia & Miguel Reception');

    expect(updated.id, event.id);
    expect(updated.name, 'Sofia & Miguel Reception');
    expect(updated.eventType, EventType.wedding);
    expect(updated.tradition, Tradition.catholic);
  });
}
