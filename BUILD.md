# Build Instructions

This document provides comprehensive instructions for building the Fitness App for different environments.

## Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android SDK
- Git
- Windows PowerShell or Command Prompt

## Environment Flavors

The app supports three different environments:

### 1. Development (dev)
- **Purpose**: Local development and testing
- **Features**: Debug logging, mock data, debug banner
- **API**: Development server
- **App ID**: `com.example.fitness_app.dev`

### 2. Staging (staging)
- **Purpose**: Pre-production testing
- **Features**: Limited logging, real API, testing features
- **API**: Staging server
- **App ID**: `com.example.fitness_app.staging`

### 3. Production (prod)
- **Purpose**: Live app store release
- **Features**: Minimal logging, real API, optimized performance
- **API**: Production server
- **App ID**: `com.example.fitness_app`

## Build Commands

### Quick Build Scripts

Use the provided batch scripts in the `scripts/` directory:

```bash
# Build development APK
scripts/build_dev.bat

# Build staging APK
scripts/build_staging.bat

# Build production APK
scripts/build_prod.bat

# Build all flavors
scripts/build_all.bat
```

### Manual Build Commands

#### Development Build
```bash
flutter clean
flutter pub get
flutter build apk --flavor dev --target lib/main_dev.dart --release
```

#### Staging Build
```bash
flutter clean
flutter pub get
flutter build apk --flavor staging --target lib/main_staging.dart --release
```

#### Production Build
```bash
flutter clean
flutter pub get
flutter build apk --flavor prod --target lib/main_prod.dart --release
```

### Debug Builds

For debug builds (faster compilation, debugging enabled):

```bash
# Development debug
flutter run --flavor dev --target lib/main_dev.dart

# Staging debug
flutter run --flavor staging --target lib/main_staging.dart

# Production debug
flutter run --flavor prod --target lib/main_prod.dart
```

## Output Locations

After successful builds, APK files will be located at:

- **Development**: `build/app/outputs/flutter-apk/app-dev-release.apk`
- **Staging**: `build/app/outputs/flutter-apk/app-staging-release.apk`
- **Production**: `build/app/outputs/flutter-apk/app-prod-release.apk`

## Environment Configuration

Each environment has its own configuration file:

- **Development**: `lib/config/environments/dev_config.dart`
- **Staging**: `lib/config/environments/staging_config.dart`
- **Production**: `lib/config/environments/prod_config.dart`

### Configuration Features

| Feature | Development | Staging | Production |
|---------|-------------|---------|------------|
| Debug Logging | ✅ | ✅ | ❌ |
| Crash Reporting | ❌ | ✅ | ✅ |
| Analytics | ❌ | ✅ | ✅ |
| Debug Menu | ✅ | ❌ | ❌ |
| Mock Data | ✅ | ❌ | ❌ |
| Performance Monitoring | ✅ | ✅ | ✅ |

## Troubleshooting

### Common Issues

1. **Build fails with "flavor not found"**
   - Ensure you're using the correct flavor name (dev, staging, prod)
   - Check that the flavor is defined in `android/app/build.gradle.kts`

2. **APK not found after build**
   - Check the output directory: `build/app/outputs/flutter-apk/`
   - Ensure the build completed successfully without errors

3. **App crashes on startup**
   - Check device logs: `flutter logs`
   - Verify the correct main file is being used for the flavor

### Clean Build

If you encounter issues, try a clean build:

```bash
flutter clean
flutter pub get
flutter pub upgrade
# Then run your build command
```

## CI/CD Integration

For automated builds, use these commands in your CI/CD pipeline:

```yaml
# Example GitHub Actions step
- name: Build APK
  run: |
    flutter clean
    flutter pub get
    flutter build apk --flavor ${{ matrix.flavor }} --target lib/main_${{ matrix.flavor }}.dart --release
```

## Signing

For production releases, ensure you have proper signing configured in `android/app/build.gradle.kts`:

```kotlin
signingConfigs {
    create("release") {
        storeFile = file("path/to/keystore.jks")
        storePassword = "your_store_password"
        keyAlias = "your_key_alias"
        keyPassword = "your_key_password"
    }
}
```

## Performance Optimization

Production builds include:
- Code minification
- Resource shrinking
- ProGuard rules
- Optimized images
- Lazy loading

## Support

For build-related issues, check:
1. Flutter doctor: `flutter doctor -v`
2. Build logs for specific error messages
3. Environment configuration files
4. Android SDK and build tools versions
