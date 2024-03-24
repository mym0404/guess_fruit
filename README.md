<div align="center">

<a href="https://github.com/mym0404"><img alt="GitHub: mym0404" src="https://img.shields.io/github/followers/mym0404?label=Follow&style=social" /></a>
<a href="https://github.com/mym0404/flutter-boilerplate"><img src="https://img.shields.io/github/stars/mym0404/flutter-boilerplate?style=social" /></a>
<a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"/></a>

</div>

# Flutter Simple Boilerplate

A simple boilerplate project for the new Flutter application.

Pre-installed packages and boilerplate codes are often opinionated by author.

But components are easily opt-outed by hand or you can just pick useful parts of the project.

You can use this project as Flutter app initialization sample for guide & study.

This Project doesn't provide any architecture layer.

The main purpose of this project aims skip install & package setup phases with extra utils.

## Project Settings

- Platforms: `android`, `ios` (Add more with CLI if you need)
- Dart: `>=3.1.3 <4.0.0`

## Pre-installed Packages

### UI

- [gap](https://pub.dev/packages/gap)

Add a gap within `Column` or `Row` easily

- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

Generate Splash screen codes automatically for each platforms

- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

### Routing

- [go_router](https://pub.dev/packages/go_router)

### Dependency Injection

- [get_it](https://pub.dev/packages/get_it)

Simplest service locator style dependency injection solution

- [watch_it](https://pub.dev/packages/watch_it)

A addon package for `get_it` that provides mixins and watch features.

### Utility

- [freezed](https://pub.dev/packages/freezed)
- [json_serializable](https://pub.dev/packages/json_serializable)

Static boilerplate generation tool for class.

It generates `copyWith`, equality check, json serialization and other many annotations.

- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [logger](https://pub.dev/packages/logger)
- [collection](https://pub.dev/packages/collection)
- [local_file_preferences](https://pub.dev/packages/local_file_preferences)

### Localization

[Flutter L10N docs](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization)

- [flutter_localizations](https://pub.dev/packages/flutter_localization)
- [intl](https://pub.dev/packages/intl)
- [intl_utils](https://pub.dev/packages/intl_utils)

## Getting Started
**Step 1:**

Fork, download or clone this repo by using the link below:

```
https://github.com/mym0404/flutter_boilerplate.git
```

**Step 2:**

```cmd
# create iOS Project
flutter create -i swift --platforms ios --org <your org> --project-name <name> .
 
# create android Project
flutter create -i swift --platforms android --org <your org> --project-name <name> .

# create web Project
flutter create --platforms web --project-name <name> .

# get pub dependencies
flutter pub get

# generate localization  
dart run intl_utils:generate

# generate ...
dart run build_runner build --delete-conflicting-outputs

# generate launcher icon
dart run flutter_launcher_icons

# generate splash screen
dart run flutter_native_splash:create
```


## Folder structure
```
flutter_boilerplate/
|- assets/                    (assets)
|- lib/
  |- common/                  (common features, ui, util)
  |- design/                  (design system)
  |- feature/                 (features)
    |- home/                  (sample feature)
  |- l10n/                    (localization)
  |- service/                 (service group)
    |- bootstrap/             (about application initialization)
    |- di/                    (dependency injection)
  |- export.dart              (common export files)
  |- main.dart                (app entry point)
```
