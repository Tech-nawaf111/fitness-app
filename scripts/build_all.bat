@echo off
echo Building Fitness App for All Flavors...
echo.

REM Clean previous builds
echo Cleaning previous builds...
flutter clean
flutter pub get

echo.
echo ========================================
echo Building Development APK...
echo ========================================
flutter build apk --flavor dev --target lib/main_dev.dart --release
if %errorlevel% neq 0 (
    echo Development build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Building Staging APK...
echo ========================================
flutter build apk --flavor staging --target lib/main_staging.dart --release
if %errorlevel% neq 0 (
    echo Staging build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Building Production APK...
echo ========================================
flutter build apk --flavor prod --target lib/main_prod.dart --release
if %errorlevel% neq 0 (
    echo Production build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo All builds completed successfully!
echo ========================================
echo.
echo APK locations:
echo - Development: build\app\outputs\flutter-apk\app-dev-release.apk
echo - Staging: build\app\outputs\flutter-apk\app-staging-release.apk
echo - Production: build\app\outputs\flutter-apk\app-prod-release.apk
echo.
pause
