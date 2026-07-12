import 'package:flutter/material.dart';

import 'data/event_repository.dart';
import 'screens/home_screen.dart';
import 'strings/app_strings.dart';
import 'theme/champagne_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = await IsarEventRepository.open();
  runApp(EventsApp(repository: repository));
}

class EventsApp extends StatefulWidget {
  const EventsApp({required this.repository, super.key});

  final EventRepository repository;

  @override
  State<EventsApp> createState() => _EventsAppState();
}

class _EventsAppState extends State<EventsApp> {
  @override
  void dispose() {
    widget.repository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: buildChampagneTheme(Brightness.light),
      darkTheme: buildChampagneTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: HomeScreen(repository: widget.repository),
    );
  }
}
