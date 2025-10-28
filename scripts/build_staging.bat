@echo off
echo Building Fitness App for Staging...
echo.

REM Clean previous builds
echo Cleaning previous builds...
flutter clean
flutter pub get

REM Build APK for staging
echo Building APK for staging...
flutter build apk --flavor staging --target lib/main_staging.dart --release

echo.
echo Staging APK built successfully!
echo APK location: build\app\outputs\flutter-apk\app-staging-release.apk
pause
