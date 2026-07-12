import 'package:events_app/data/event_repository.dart';
import 'package:events_app/models/event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('repository persists events across restart', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});

    final repository1 = await IsarEventRepository.open();
    final created = await repository1.save(
      Event.create(
        name: 'Sofia & Miguel',
        eventType: EventType.wedding,
        tradition: Tradition.catholic,
      ),
    );
    await repository1.close();

    final repository2 = await IsarEventRepository.open();
    final fetched = await repository2.getById(created.id);

    expect(fetched, isNotNull);
    expect(fetched!.name, 'Sofia & Miguel');

    await repository2.close();
  });
}
