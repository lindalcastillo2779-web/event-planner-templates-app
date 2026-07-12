import 'package:flutter/material.dart';

import '../theme/champagne_theme.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final tokens = context.champagneTokens;
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: tokens.cardRadius,
          color: tokens.champagne,
          border: Border.all(color: tokens.border),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: tokens.graphite),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: tokens.secondaryText),
            ),
          ],
        ),
      ),
    );
  }
}
