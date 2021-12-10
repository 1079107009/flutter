#!/usr/bin/env bash
flutter pub pub run intl_generator:extract_to_arb --output-dir=res lib/l10n/localization_intl.dart
flutter pub pub run intl_generator:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization_intl.dart res/intl_*.arb

