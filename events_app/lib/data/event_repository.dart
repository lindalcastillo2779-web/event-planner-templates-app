import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/event.dart';

abstract class EventRepository {
  Stream<List<Event>> watchEvents();
  Future<List<Event>> getEvents();
  Future<Event?> getById(String id);
  Future<Event> save(Event event);
  Future<void> delete(String id);
  Future<void> close();
}

class IsarEventRepository implements EventRepository {
  IsarEventRepository._(this._preferences, this._events) {
    _controller = StreamController<List<Event>>.broadcast();
    _controller.onListen =
        () => _controller.add(List<Event>.unmodifiable(_sortedEvents()));
  }

  final SharedPreferences _preferences;
  final List<Event> _events;
  late final StreamController<List<Event>> _controller;

  static const String _storeName = 'events_hub_json';

  static Future<IsarEventRepository> open() async {
    final preferences = await SharedPreferences.getInstance();
    final events = await _load(preferences);
    return IsarEventRepository._(preferences, events);
  }

  static Future<List<Event>> _load(SharedPreferences preferences) async {
    final raw = preferences.getString(_storeName);
    if (raw == null || raw.trim().isEmpty) {
      return <Event>[];
    }

    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded.cast<Map<String, dynamic>>().map(Event.fromJson).toList();
  }

  List<Event> _sortedEvents() {
    final events = List<Event>.from(_events)
      ..sort((left, right) => right.createdAt.compareTo(left.createdAt));
    return events;
  }

  Future<void> _persist() async {
    final jsonText =
        jsonEncode(_events.map((event) => event.toJson()).toList());
    await _preferences.setString(_storeName, jsonText);
  }

  void _emit() {
    _controller.add(List<Event>.unmodifiable(_sortedEvents()));
  }

  @override
  Stream<List<Event>> watchEvents() {
    return _controller.stream;
  }

  @override
  Future<List<Event>> getEvents() async {
    return _sortedEvents();
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
  Future<Event> save(Event event) async {
    final now = DateTime.now();
    final existingIndex = _events.indexWhere((item) => item.id == event.id);
    final savedEvent = event.copyWith(
      createdAt: existingIndex == -1
          ? event.createdAt
          : _events[existingIndex].createdAt,
      updatedAt: now,
    );

    if (existingIndex == -1) {
      _events.add(savedEvent);
    } else {
      _events[existingIndex] = savedEvent;
    }

    await _persist();
    _emit();
    return savedEvent;
  }

  @override
  Future<void> delete(String id) async {
    _events.removeWhere((event) => event.id == id);
    await _persist();
    _emit();
  }

  @override
  Future<void> close() async {
    await _controller.close();
  }
}
