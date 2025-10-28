@echo off
echo Building Fitness App for Production...
echo.

REM Clean previous builds
echo Cleaning previous builds...
flutter clean
flutter pub get

REM Build APK for production
echo Building APK for production...
flutter build apk --flavor prod --target lib/main_prod.dart --release

echo.
echo Production APK built successfully!
echo APK location: build\app\outputs\flutter-apk\app-prod-release.apk
pause
