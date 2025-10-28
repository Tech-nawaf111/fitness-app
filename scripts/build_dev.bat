@echo off
echo Building Fitness App for Development...
echo.

REM Clean previous builds
echo Cleaning previous builds...
flutter clean
flutter pub get

REM Build APK for development
echo Building APK for development...
flutter build apk --flavor dev --target lib/main_dev.dart --release

echo.
echo Development APK built successfully!
echo APK location: build\app\outputs\flutter-apk\app-dev-release.apk
pause
