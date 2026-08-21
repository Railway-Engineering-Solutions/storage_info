# Storage Info

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A Flutter plugin to get total and available device storage information for iOS and Android devices.

## Installation

```yaml
dependencies:
  storage_info: ^1.0.0
```

## Usage

Import the package:

```dart
import 'package:storage_info/storage_info.dart';
```

Get storage information:

```dart
Future<void> getStorageInfo() async {
  try {
    final storageInfo = StorageInfo();
    final info = await storageInfo.getStorageInfo();
    
    print('Total storage: ${info.totalBytes} bytes');
    print('Free storage: ${info.freeBytes} bytes');
    print('Used storage: ${info.usedBytes} bytes');
    print('Used percentage: ${info.usedPercentage * 100}%');
    print('Free percentage: ${info.freePercentage * 100}%');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Platform Support

| Android 24+ | iOS 15+ |
|-------------|---------|
| ✅           | ✅       |

## Android Configuration

No storage permission is required. The plugin reports capacity for the volume
that contains the app's data directory.

## Features

* Get total device storage in bytes
* Get available/free storage in bytes
* Get used storage in bytes
* Calculate percentage of used and free storage

## Installation 💻

**❗ In order to start using Storage Info you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
dart pub add storage_info
```

---

## Continuous Integration 🤖

Storage Info comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
