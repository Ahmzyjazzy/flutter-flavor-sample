# flavor_test

A sample flutter project to showcase how to create 

- different flavor setup for flutter project.
- different icon launcher per flavour 

It works for both android and ios build

This example uses three flavors
- DEVELOPMENT
- STAGING
- PRODUCTION

## To run each flavor target

- flutter run --target lib/main_development.dart
- flutter run --target lib/main_staging.dart
- flutter run --target lib/main_production.dart

## To run each flavor target with customized app name and app icon
```You will add the --flavor flag. Note that there is an extra setup specifically for android and ios for this steps```

- flutter run --target lib/main_development.dart --flavor development
- flutter run --target lib/main_staging.dart --flavor staging
- flutter run --target lib/main_production.dart --flavor production

https://youtu.be/Vhm1Cv2uPko?t=118




## Getting With Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
