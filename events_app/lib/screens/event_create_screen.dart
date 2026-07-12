import 'package:flutter/material.dart';

import '../data/event_repository.dart';
import '../models/event.dart';
import '../strings/app_strings.dart';
import '../theme/champagne_theme.dart';
import 'event_dashboard_screen.dart';

class EventCreateScreen extends StatefulWidget {
  const EventCreateScreen({
    required this.repository,
    this.initialEvent,
    super.key,
  });

  final EventRepository repository;
  final Event? initialEvent;

  @override
  State<EventCreateScreen> createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  final _nameController = TextEditingController();
  final _venueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int _stepIndex = 0;
  EventType _eventType = EventType.other;
  Tradition _tradition = Tradition.none;
  DateTime? _date;

  bool get _isEdit => widget.initialEvent != null;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialEvent;
    if (initial != null) {
      _nameController.text = initial.name;
      _venueController.text = initial.venueName ?? '';
      _eventType = initial.eventType;
      _tradition = initial.tradition;
      _date = initial.date;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _venueController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_stepIndex < 3) {
      setState(() {
        _stepIndex++;
      });
    }
  }

  void _backStep() {
    if (_stepIndex > 0) {
      setState(() {
        _stepIndex--;
      });
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final base = widget.initialEvent;
    final event = (base ??
            Event.create(
              name: _nameController.text.trim(),
              eventType: _eventType,
              tradition: _tradition,
            ))
        .copyWith(
      name: _nameController.text.trim(),
      eventType: _eventType,
      tradition: _tradition,
      date: _date,
      venueName: _venueController.text.trim().isEmpty
          ? null
          : _venueController.text.trim(),
    );

    final saved = await widget.repository.save(event);
    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) => EventDashboardScreen(
          repository: widget.repository,
          eventId: saved.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.champagneTokens;
    final isNameStep = _stepIndex == 2;
    final isFinalStep = _stepIndex == 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            _isEdit ? AppStrings.editEventTitle : AppStrings.createEventTitle),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: IndexedStack(
                  index: _stepIndex,
                  children: <Widget>[
                    _StepShell(
                      title: AppStrings.eventTypeStepTitle,
                      child: DropdownButtonFormField<EventType>(
                        value: _eventType,
                        items: AppStrings.eventTypeLabels.entries
                            .map(
                              (entry) => DropdownMenuItem<EventType>(
                                value: entry.key,
                                child: Text(entry.value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _eventType = value;
                            });
                          }
                        },
                      ),
                    ),
                    _StepShell(
                      title: AppStrings.traditionStepTitle,
                      child: DropdownButtonFormField<Tradition>(
                        value: _tradition,
                        items: AppStrings.traditionLabels.entries
                            .map(
                              (entry) => DropdownMenuItem<Tradition>(
                                value: entry.key,
                                child: Text(entry.value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _tradition = value;
                            });
                          }
                        },
                      ),
                    ),
                    _StepShell(
                      title: AppStrings.nameStepTitle,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: AppStrings.eventNameLabel,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.eventNameRequired;
                          }
                          return null;
                        },
                      ),
                    ),
                    _StepShell(
                      title: AppStrings.dateStepTitle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          OutlinedButton(
                            onPressed: _pickDate,
                            child: const Text(AppStrings.chooseDate),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppStrings.dateAndVenue(
                                date: _date, venueName: null),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: tokens.secondaryText),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _venueController,
                            decoration: const InputDecoration(
                              labelText: AppStrings.venueLabel,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  OutlinedButton(
                    onPressed: _stepIndex == 0 ? null : _backStep,
                    child: const Text(AppStrings.back),
                  ),
                  const SizedBox(width: 8),
                  if (!isNameStep)
                    OutlinedButton(
                      onPressed: isFinalStep ? _save : _nextStep,
                      child: const Text(AppStrings.skip),
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: isFinalStep ? _save : _nextStep,
                    child:
                        Text(isFinalStep ? AppStrings.save : AppStrings.next),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepShell extends StatelessWidget {
  const _StepShell({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tokens = context.champagneTokens;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: tokens.goldTextOnPearl),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
