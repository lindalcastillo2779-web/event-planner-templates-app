# Events Planner & Templates App

This repository contains the Flutter app for **ProPlanners** — an Events Hub where you can create, view, edit, and delete events for weddings, quinceañeras, baptisms, first communions, confirmations, ordinations, and more.

## What this app is

- A **paid mobile app** (one-time purchase on the App Store and Google Play, plus optional template-pack purchases — no subscription, no ads, no account required).
- A **free browser demo** at https://www.proplanners.app so people can try it before buying.
- All your data stays on your device. Nothing is uploaded anywhere.

## Design system — read this before touching any UI code

The visual direction is **Champagne, rev A** (owner-approved, see DECISIONS.log D-015):

- Text and primary buttons are **graphite #2B2B2E** (NOT slate #4A4E58).
- Buttons are **4px rounded rectangles** (NOT pills). The satin progress bar is the only pill-shaped element.
- Full token table lives in BRIEF-001 and `lib/theme/champagne_theme.dart`. No hardcoded colors anywhere else.

⚠️ **The style-tile image in this repo (IMG_4514) shows the OLD pre-rev-A design** — slate text and pill buttons. Use it for layout and mood only. Tokens come from BRIEF-001, not the image.

## Local data storage

The app stores events on your device using **drift** (a SQLite database for Flutter). Drift was chosen over shared_preferences because the roadmap includes guest lists, budgets, RSVPs, and seating charts — relational data that needs a real database. See DECISIONS.log D-016.

## Important org id note

The package id currently uses `com.champagne.events` as a placeholder. Before store submission, confirm your final company id and update the Android and iOS bundle ids.

## Prerequisites (beginner version)

1. Install Flutter stable from https://docs.flutter.dev/get-started/install
2. Install Android Studio if you want to run on Android.
3. Install Xcode if you want to run on iPhone simulator or iPhone (macOS only).
4. On Linux desktop, install the packages `ninja-build` and `libgtk-3-dev`.
5. Run `flutter doctor` and follow any remaining instructions.

## Quick start (under 10 minutes)

1. Open a terminal in this repository.
2. Move into the app folder: `cd events_app`
3. Install dependencies: `flutter pub get`
4. Run static checks: `flutter analyze`
5. Run tests: `flutter test`

## The website: free demo + marketing (not a store)

https://www.proplanners.app is the **free browser demo and marketing site**. It is built from this repo's Flutter web target and deployed via GitHub Pages. It does **not** process payments — purchases happen only through the App Store and Google Play (see DECISIONS.log D-017). Web-direct payments may be added in v1.x once revenue justifies a backend.

### Deploy to GitHub Pages

1. Push your changes to GitHub.
2. The workflow named **Deploy Flutter Web to GitHub Pages** runs automatically on every push to `main` and enables GitHub Pages for the repository on its first successful run.
3. If you want to verify or change the configuration, go to **Settings → Pages** and confirm Source is set to **GitHub Actions**.
4. Wait for the workflow to finish.
5. Your site will be live at the GitHub Pages URL shown in the workflow output.

Note: GitHub Pages on a **private** repository requires a paid GitHub plan. If your Pages deployment isn't appearing, check the repo's visibility and your plan.

### Connect the Namecheap custom domain

1. In Namecheap, open **Domain List → Manage → Advanced DNS**.
2. Add these records for the root domain (proplanners.app):
   - Type A, Host @, Value 185.199.108.153
   - Type A, Host @, Value 185.199.109.153
   - Type A, Host @, Value 185.199.110.153
   - Type A, Host @, Value 185.199.111.153
3. Add this record for www:
   - Type CNAME, Host www, Value `<your-github-username>.github.io`
4. In GitHub, open **Settings → Pages** and set Custom domain to your domain.
5. Enable **Enforce HTTPS** after the certificate is issued.

DNS changes can take a few minutes to 24 hours to fully propagate.

## Run on Android

1. Open Android Studio once and let it install the Android SDK.
2. Connect a device with USB debugging, or start an Android emulator from Device Manager.
3. In terminal: `cd events_app` then `flutter run`

## Run on iOS (macOS only)

1. Install Xcode from the App Store.
2. Open Xcode once, accept the license, and install simulator components.
3. Start an iOS simulator from Xcode.
4. In terminal: `cd events_app` then `flutter run`

## Run on Linux desktop

1. Install desktop dependencies: `sudo apt-get update && sudo apt-get install -y ninja-build libgtk-3-dev`
2. In terminal: `cd events_app` then `flutter run -d linux`

## Run on Windows desktop

1. Install Visual Studio with the **Desktop development with C++** workload.
2. In terminal: `cd events_app` then `flutter run -d windows`

## Run on macOS desktop

1. Install Xcode command line tools.
2. In terminal: `cd events_app` then `flutter run -d macos`

## Project structure

```
events_app/
  lib/
    main.dart
    theme/champagne_theme.dart
    models/event.dart
    data/event_repository.dart      # drift-backed repository
    data/app_database.dart          # drift database definition
    screens/home_screen.dart
    screens/event_create_screen.dart
    screens/event_dashboard_screen.dart
    widgets/event_masthead.dart
    widgets/module_card.dart
    strings/app_strings.dart
  test/
```

## Monetization (for contributors and future-you)

- One-time base app purchase + non-consumable template-pack IAPs (D-006).
- Prices are set in App Store Connect and Google Play Console, never in code.
- Before store submission you need: an Apple Developer account ($99/year), a Google Play developer account ($25 one-time), and a finalized bundle id.
- The web demo is the top of the marketing funnel: "Try it in your browser → buy the full app."





