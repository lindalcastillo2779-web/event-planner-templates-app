import 'package:uuid/uuid.dart';

enum EventType {
  wedding,
  quinceanera,
  baptism,
  firstCommunion,
  confirmation,
  ordination,
  birthday,
  shower,
  anniversary,
  other,
}

enum Tradition {
  catholic,
  christianNondenominational,
  other,
  none,
}

class Event {
  Event({
    required this.id,
    required this.name,
    required this.eventType,
    required this.tradition,
    this.date,
    this.venueName,
    this.guestCountTarget,
    required this.linkedEventIds,
    required this.createdAt,
    required this.updatedAt,
  });

  static Event create({
    String? id,
    required String name,
    required EventType eventType,
    required Tradition tradition,
    DateTime? date,
    String? venueName,
    int? guestCountTarget,
    List<String>? linkedEventIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final now = DateTime.now();
    return Event(
      id: id ?? const Uuid().v4(),
      name: name,
      eventType: eventType,
      tradition: tradition,
      date: date,
      venueName: venueName,
      guestCountTarget: guestCountTarget,
      linkedEventIds: linkedEventIds ?? <String>[],
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );
  }

  late String id;

  late String name;
  late EventType eventType;
  late Tradition tradition;
  DateTime? date;
  String? venueName;
  int? guestCountTarget;
  late List<String> linkedEventIds;
  late DateTime createdAt;
  late DateTime updatedAt;

  Event copyWith({
    String? id,
    String? name,
    EventType? eventType,
    Tradition? tradition,
    DateTime? date,
    String? venueName,
    int? guestCountTarget,
    List<String>? linkedEventIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Event(
      id: id ?? this.id,
      name: name ?? this.name,
      eventType: eventType ?? this.eventType,
      tradition: tradition ?? this.tradition,
      date: date ?? this.date,
      venueName: venueName ?? this.venueName,
      guestCountTarget: guestCountTarget ?? this.guestCountTarget,
      linkedEventIds: linkedEventIds ?? List<String>.from(this.linkedEventIds),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'eventType': eventType.name,
      'tradition': tradition.name,
      'date': date?.toIso8601String(),
      'venueName': venueName,
      'guestCountTarget': guestCountTarget,
      'linkedEventIds': linkedEventIds,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['name'] as String,
      eventType: EventType.values.byName(json['eventType'] as String),
      tradition: Tradition.values.byName(json['tradition'] as String),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      venueName: json['venueName'] as String?,
      guestCountTarget: json['guestCountTarget'] as int?,
      linkedEventIds:
          (json['linkedEventIds'] as List<dynamic>?)?.cast<String>() ??
              <String>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
