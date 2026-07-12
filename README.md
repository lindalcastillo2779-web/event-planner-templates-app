# Events Planner & Templates App

This repository contains a Flutter app scaffold for an Events Hub where you can create, view, edit, and delete events.

## What was set up
1. Flutter stable was installed locally in this workspace so the project can be built here.
2. A new Flutter project was created at `events_app` with org id `com.champagne.events`.
3. The app now includes a Champagne theme system, local event persistence, and tests.

## Important org id note
The package id currently uses `com.champagne.events` as a placeholder.
Before store submission, confirm your final company id and update Android and iOS bundle ids.

## Local data storage
The app stores events on your device using `shared_preferences`, so your data stays after app restarts.

## Prerequisites (beginner version)
1. Install Flutter stable from https://docs.flutter.dev/get-started/install.
2. Install Android Studio if you want to run on Android.
3. Install Xcode if you want to run on iPhone simulator or iPhone.
4. On Linux desktop, install packages `ninja-build` and `libgtk-3-dev`.
5. Run `flutter doctor` and follow any remaining instructions.

## Quick start (under 10 minutes)
1. Open a terminal in this repository.
2. Move into the app folder:

```bash
cd events_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run static checks:

```bash
flutter analyze
```

5. Run tests:

```bash
flutter test
```

## Deploy to GitHub Pages
This repo now includes a workflow that builds and deploys Flutter web from `main`.

1. Push your changes to GitHub.
2. In your GitHub repo, go to `Settings` → `Pages`.
3. Under `Build and deployment`, set `Source` to `GitHub Actions`.
4. Wait for the workflow named `Deploy Flutter Web to GitHub Pages` to finish.
5. Your site will be live at the GitHub Pages URL shown in the workflow output.

## Connect Namecheap custom domain
After GitHub Pages is live, connect your Namecheap domain:

1. In Namecheap, open `Domain List` → `Manage` → `Advanced DNS`.
2. Add these records for the root domain (`yourdomain.com`):
	- Type `A`, Host `@`, Value `185.199.108.153`
	- Type `A`, Host `@`, Value `185.199.109.153`
	- Type `A`, Host `@`, Value `185.199.110.153`
	- Type `A`, Host `@`, Value `185.199.111.153`
3. Add this record for `www`:
	- Type `CNAME`, Host `www`, Value `<your-github-username>.github.io`
4. In GitHub, open `Settings` → `Pages` and set `Custom domain` to your domain.
5. Enable `Enforce HTTPS` after the certificate is issued.

DNS changes can take a few minutes to 24 hours to fully propagate.

## Run on Android
1. Open Android Studio once and let it install the Android SDK.
2. Connect a device with USB debugging, or start an Android emulator from Device Manager.
3. In terminal:

```bash
cd events_app
flutter run
```

## Run on iOS (macOS only)
1. Install Xcode from the App Store.
2. Open Xcode once, accept the license, and install simulator components.
3. Start an iOS simulator from Xcode.
4. In terminal:

```bash
cd events_app
flutter run
```

## Run on Linux desktop
1. Install desktop dependencies:

```bash
sudo apt-get update
sudo apt-get install -y ninja-build libgtk-3-dev
```

2. In terminal:

```bash
cd events_app
flutter run -d linux
```

## Run on Windows desktop
1. Install Visual Studio with the Desktop development with C++ workload.
2. In terminal:

```powershell
cd events_app
flutter run -d windows
```

## Run on macOS desktop
1. Install Xcode command line tools.
2. In terminal:

```bash
cd events_app
flutter run -d macos
```

## Project structure
```text
events_app/
	lib/
		main.dart
		theme/champagne_theme.dart
		models/event.dart
		data/event_repository.dart
		screens/home_screen.dart
		screens/event_create_screen.dart
		screens/event_dashboard_screen.dart
		widgets/event_masthead.dart
		widgets/module_card.dart
		strings/app_strings.dart
	test/
```
