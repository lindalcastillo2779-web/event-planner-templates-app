import 'package:flutter/material.dart';

import '../models/event.dart';
import '../strings/app_strings.dart';
import '../theme/champagne_theme.dart';

class EventMasthead extends StatelessWidget {
  const EventMasthead({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final tokens = context.champagneTokens;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);

    final title = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: _buildTitleSpans(
          text: event.name,
          baseStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: tokens.graphite,
                fontFamily: tokens.displayFontFamily,
              ),
          connectorStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: tokens.goldTextOnPearl,
                fontFamily: tokens.displayFontFamily,
              ),
        ),
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

    final heroTitle = disableAnimations
        ? title
        : Hero(
            tag: 'event-masthead-${event.id}',
            child: Material(color: tokens.pearl.withAlpha(0), child: title),
          );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            heroTitle,
            const SizedBox(height: 12),
            Text(
              AppStrings.dateAndVenue(
                      date: event.date, venueName: event.venueName)
                  .toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: tokens.secondaryText,
                    letterSpacing: tokens.dateVenueLetterSpacing,
                    fontFamily: tokens.bodyFontFamily,
                  ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: tokens.mastheadMaxWidth),
              child: ClipRRect(
                borderRadius: tokens.progressPillRadius,
                child: Container(
                  height: 10,
                  color: tokens.champagne,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final targetWidth =
                          constraints.maxWidth * tokens.dashboardProgress;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: disableAnimations
                              ? tokens.instantDuration
                              : tokens.motionDuration,
                          curve: Curves.easeOut,
                          width: targetWidth,
                          color: tokens.gold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              event.date == null
                  ? AppStrings.dateToBeDecided
                  : AppStrings.statusWithCountdown(event.date!),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: tokens.secondaryText),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _buildTitleSpans({
    required String text,
    required TextStyle? baseStyle,
    required TextStyle? connectorStyle,
  }) {
    final spans = <TextSpan>[];
    final connectorPattern = RegExp(r'(&|·)');
    final matches = connectorPattern.allMatches(text);

    if (matches.isEmpty) {
      return <TextSpan>[TextSpan(text: text, style: baseStyle)];
    }

    var currentIndex = 0;
    for (final match in matches) {
      if (match.start > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, match.start),
            style: baseStyle,
          ),
        );
      }
      spans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: connectorStyle,
        ),
      );
      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex), style: baseStyle));
    }
    return spans;
  }
}
