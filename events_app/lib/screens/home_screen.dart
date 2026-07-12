import 'package:flutter/material.dart';

import '../data/event_repository.dart';
import '../models/event.dart';
import '../strings/app_strings.dart';
import '../theme/champagne_theme.dart';
import 'event_create_screen.dart';
import 'event_dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.repository, super.key});

  final EventRepository repository;

  @override
  Widget build(BuildContext context) {
    final tokens = context.champagneTokens;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.eventsHubTitle)),
      body: StreamBuilder<List<Event>>(
        stream: repository.watchEvents(),
        builder: (context, snapshot) {
          final events = snapshot.data ?? <Event>[];
          if (events.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  AppStrings.emptyStateTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: tokens.secondaryText),
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final event = events[index];
              final disableAnimations = MediaQuery.disableAnimationsOf(context);
              final titleWidget = Text(
                event.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: tokens.graphite),
              );

              return Card(
                child: InkWell(
                  borderRadius: tokens.cardRadius,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) {
                          return EventDashboardScreen(
                            repository: repository,
                            eventId: event.id,
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        disableAnimations
                            ? titleWidget
                            : Hero(
                                tag: 'event-masthead-${event.id}',
                                child: titleWidget),
                        const SizedBox(height: 8),
                        Text(
                          AppStrings.eventSummary(
                            name: event.name,
                            eventType: event.eventType,
                            date: event.date,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: tokens.secondaryText),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: events.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => EventCreateScreen(repository: repository),
            ),
          );
        },
        label: const Text(AppStrings.createEvent),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
