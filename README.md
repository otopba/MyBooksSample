####

How to run? Just press green button on Android Studio or another IDE

#### Models

```bash
flutter packages pub run build_runner build
```

#### Localization

```bash
flutter pub run intl_generator:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/localizations.dart lib/l10n/intl_*.arb
```