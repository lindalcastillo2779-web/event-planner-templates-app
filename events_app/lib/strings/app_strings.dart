import 'package:intl/intl.dart';

import '../models/event.dart';

class AppStrings {
  static const appTitle = 'Events Planner & Templates App';
  static const eventsHubTitle = 'Events Hub';
  static const createEvent = 'Create event';
  static const createEventTitle = 'Create Event';
  static const editEventTitle = 'Edit Event';
  static const emptyStateTitle =
      'Every celebration starts here. Create your first event.';
  static const eventTypeStepTitle = 'Event type';
  static const traditionStepTitle = 'Tradition';
  static const nameStepTitle = 'Event name';
  static const dateStepTitle = 'Date';
  static const venueLabel = 'Venue';
  static const dateLabel = 'Date';
  static const eventNameLabel = 'Event name';
  static const skip = 'Skip';
  static const back = 'Back';
  static const next = 'Next';
  static const save = 'Save';
  static const edit = 'Edit';
  static const delete = 'Delete';
  static const cancel = 'Cancel';
  static const dateToBeDecided = 'Date to be decided';
  static const plannedPercent = '62% planned';
  static const connectorDot = ' · ';
  static const connectorAmpersand = '&';
  static const comingSoon = 'coming soon';
  static const chooseDate = 'Choose date';
  static const clearDate = 'Clear date';
  static const eventNameRequired = 'Please add an event name.';

  static const moduleLabels = <String>[
    'Checklist',
    'Budget',
    'Guests',
    'Floor Plan',
    'Templates',
    'Timeline',
  ];

  static final eventTypeLabels = <EventType, String>{
    EventType.wedding: 'Wedding',
    EventType.quinceanera: 'Quinceañera',
    EventType.baptism: 'Baptism',
    EventType.firstCommunion: 'First Communion',
    EventType.confirmation: 'Confirmation',
    EventType.ordination: 'Ordination',
    EventType.birthday: 'Birthday',
    EventType.shower: 'Shower',
    EventType.anniversary: 'Anniversary',
    EventType.other: 'Other',
  };

  static final traditionLabels = <Tradition, String>{
    Tradition.catholic: 'Catholic',
    Tradition.christianNondenominational: 'Christian (Non-denominational)',
    Tradition.other: 'Other',
    Tradition.none: 'None',
  };

  static String eventSummary({
    required String name,
    required EventType eventType,
    required DateTime? date,
  }) {
    final dateText =
        date == null ? dateToBeDecided : DateFormat.yMMMd().format(date);
    final typeLabel = eventTypeLabels[eventType]!;
    return '$name$connectorDot$typeLabel$connectorDot$dateText';
  }

  static String dateAndVenue(
      {required DateTime? date, required String? venueName}) {
    final dateText =
        date == null ? dateToBeDecided : DateFormat.yMMMd().format(date);
    final venueText = (venueName == null || venueName.trim().isEmpty)
        ? ''
        : '$connectorDot${venueName.trim()}';
    return '$dateText$venueText';
  }

  static String statusWithCountdown(DateTime date) {
    final daysToGo = date.difference(DateTime.now()).inDays;
    return '$plannedPercent$connectorDot$daysToGo days to go';
  }

  static String deleteDialogTitle(String eventName) => 'Delete $eventName?';
  static const deleteDialogBody = 'This can\'t be undone.';
}
