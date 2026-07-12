# Events Planner Templates App Description

Events Planner Templates App is a Flutter-based planning app for weddings and other faith and family celebrations, built to help users create, organize, and revisit important event details from one elegant dashboard.[1][2]

The first product slice centers on an Events Hub where users can create, view, edit, and delete events with local offline storage, then open each event into a dedicated dashboard experience.[1][2]

The app is designed for weddings first, while also supporting quinceañeras, baptisms, first communions, confirmations, ordinations, birthdays, showers, anniversaries, and other celebrations through a shared event model.[1][2]

Its visual system uses the owner-approved Champagne rev A design direction: pearl backgrounds, champagne fills, gold accents, graphite primary text, Prata display typography, and Jost for interface text, with a soft luxury tone that stays practical for planning.[3][1][2]

The broader product vision is privacy-friendly and offline-first, with no required account for core use, English at launch, externalized strings for future Spanish support, and monetization through a one-time base purchase plus optional template-pack in-app purchases rather than ads or subscriptions.[2]g event type, tradition, name, date, venue, guest target, linked events, and timestamps.[1]
- Keep all user-facing labels ready for localization through a strings map, with English at launch and Spanish planned for v1.x.[1][2]

## Design system

The selected visual direction is Champagne rev A, which replaced an earlier Pressed Ink decision and is now the owner-approved standard for the app chrome.[3][2]

Key design tokens and rules include:[3][1]

- Colors: pearl `#FBF9F5` background, champagne `#EFE6D8` soft fills, gold `#C0A062` accent, blush `#D8B7A5` highlights, graphite `#2B2B2E` primary text, and secondary text `#7E7869`.[3][1]
- Typography: Prata for display text and event names, Jost for UI and labels, with uppercase labels and 3px letter spacing where specified.[3][1]
- Shape language: 4px rounded-rectangle buttons and inputs, 12px cards, and pill styling reserved only for progress bars.[3][1]
- Motion: soft 250–300ms ease-out transitions, with all animations respecting reduce-motion settings.[1]
- Accessibility: WCAG AA contrast requirements, 44pt minimum touch targets, and support for larger accessibility font sizes without truncation in the masthead.[3][1]

## Event model

The app’s event model includes the following fields.[1]

| Field | Purpose |
|---|---|
| `id` | UUID v4 identifier for each event.[1] |
| `name` | Main event name shown throughout the UI.[1] |
| `eventType` | Celebration type such as wedding, quinceañera, baptism, or other.[1] |
| `tradition` | Tradition category including Catholic, Christian nondenominational, other, or none.[1] |
| `date` | Optional event date.[1] |
| `venueName` | Optional venue name.[1] |
| `guestCountTarget` | Optional guest target count.[1] |
| `linkedEventIds` | Related event references.[1] |
| `createdAt` / `updatedAt` | Record timestamps.[1] |

Tradition is treated as a cross-cutting attribute rather than a separate product fork, so one planning system can support multiple kinds of celebrations without splitting the experience.[2]

## Planned structure

The current implementation brief calls for these primary files and responsibilities.[1]

- `lib/main.dart` for app startup.[1]
- `theme/champagne_theme.dart` for design tokens stored in a `ThemeExtension` so style values are not hardcoded in widgets or screens.[1]
- `models/event.dart` for the event schema.[1]
- `data/event_repository.dart` for local persistence, with Drift or Isar to be chosen and justified in the README.[1]
- `screens/homescreen.dart` for the Events Hub.[1]
- `screens/eventcreatescreen.dart` for event creation.[1]
- `screens/eventdashboardscreen.dart` for the event dashboard.[1]
- `widgets/eventmasthead.dart` for the signature dashboard masthead.[1]
- `widgets/modulecard.dart` for dashboard module placeholders.[1]

## Product decisions

Several product constraints are already defined and should guide development.[2]

- Flutter and Dart are the approved stack for multi-platform support and animation consistency.[2]
- The core product is offline-first and privacy-friendly.[2]
- Core monetization is a one-time app purchase with non-consumable template-pack in-app purchases.[2]
- The app will not use ads or subscriptions.[2]
- English ships first, with Spanish planned in a later v1.x release.[2]
- The long-term differentiator is visualization, especially a 2D floor-plan editor with a stylized 3D preview rather than a full free-roam 3D designer.[2]

## Acceptance targets

The current acceptance criteria for Slice 1 require the following outcomes.[1]

- `flutter analyze` is clean, tests pass, and the app runs on iOS, Android, and at least one desktop target.[1]
- Event create, dashboard open, edit, delete, and persistence round-trip all work.[1]
- Theme values come from the theme extension rather than hardcoded style values in screens and widgets.[1]
- The masthead layout works at default, large, and extra-large accessibility font sizes.[1]
- The empty state uses warm, human copy instead of generic “no data” messaging.[1]
- Delete confirmation names the event and avoids manipulative wording.[1]
- Reduce-motion behavior is respected and verified.[1]
- The README should let a non-coder run the app in under 10 minutes per platform.[1]

## Run notes

The project brief expects the executor to install Flutter on the stable channel, verify platform toolchains, and run `flutter doctor` until clean before app work begins.[1]

Once the scaffold exists, the app should be runnable on iOS simulator or device, Android, and desktop, with beginner-friendly setup notes written in plain language.[1]
