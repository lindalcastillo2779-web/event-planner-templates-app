import 'package:flutter/material.dart';

import '../data/event_repository.dart';
import '../models/event.dart';
import '../strings/app_strings.dart';
import '../theme/champagne_theme.dart';
import '../widgets/event_masthead.dart';
import '../widgets/module_card.dart';
import 'event_create_screen.dart';

class EventDashboardScreen extends StatefulWidget {
  const EventDashboardScreen({
    required this.repository,
    required this.eventId,
    super.key,
  });

  final EventRepository repository;
  final String eventId;

  @override
  State<EventDashboardScreen> createState() => _EventDashboardScreenState();
}

class _EventDashboardScreenState extends State<EventDashboardScreen> {
  late Future<Event?> _eventFuture;

  @override
  void initState() {
    super.initState();
    _eventFuture = widget.repository.getById(widget.eventId);
  }

  Future<void> _refresh() async {
    setState(() {
      _eventFuture = widget.repository.getById(widget.eventId);
    });
  }

  Future<void> _edit(Event event) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => EventCreateScreen(
          repository: widget.repository,
          initialEvent: event,
        ),
      ),
    );
    await _refresh();
  }

  Future<void> _delete(Event event) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppStrings.deleteDialogTitle(event.name)),
          content: const Text(AppStrings.deleteDialogBody),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(AppStrings.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(AppStrings.delete),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true) {
      return;
    }

    await widget.repository.delete(event.id);
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.champagneTokens;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Event?>(
        future: _eventFuture,
        builder: (context, snapshot) {
          final event = snapshot.data;
          if (event == null) {
            return Center(
              child: Text(
                AppStrings.emptyStateTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: tokens.secondaryText),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () => _edit(event),
                      child: const Text(AppStrings.edit),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => _delete(event),
                      child: const Text(AppStrings.delete),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                EventMasthead(event: event),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppStrings.moduleLabels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return ModuleCard(
                      title: AppStrings.moduleLabels[index],
                      subtitle: AppStrings.comingSoon,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
