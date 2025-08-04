# Android 15 (API Level 35) Upgrade Summary

## Changes Made

This update brings the app into compliance with Google Play's requirement to target Android 15 (API level 35) by August 31, 2025.

### Configuration Updates

1. **Target API Level**: Updated from Android 11 (API 30) to Android 15 (API 35)
   - `compileSdkVersion`: 30 → 35
   - `targetSdkVersion`: 30 → 35

2. **Build Tool Upgrades**: 
   - **Android Gradle Plugin**: 4.1.0 → 8.0.2
   - **Gradle**: 6.7 → 8.5
   - **Kotlin**: 1.6.21 → 1.8.22

3. **Performance & Compatibility**:
   - Increased JVM memory allocation: 1536M → 2048M
   - Made Flutter SDK path optional in settings.gradle

4. **Android Manifest Fixes**:
   - Added `android:exported="true"` to MainActivity (required for API 31+)
   - Fixed package name typo in profile AndroidManifest.xml

### Files Modified

- `android/app/build.gradle` - API levels and SDK versions
- `android/build.gradle` - AGP and Kotlin versions  
- `android/gradle/wrapper/gradle-wrapper.properties` - Gradle version
- `android/gradle.properties` - JVM memory settings
- `android/app/src/main/AndroidManifest.xml` - Added exported attribute
- `android/app/src/profile/AndroidManifest.xml` - Fixed package name
- `android/settings.gradle` - Made Flutter SDK optional

## Next Steps for Testing

1. **Install Flutter**: Set up Flutter environment with compatible version
2. **Build Test**: Run `flutter build apk` to verify compilation
3. **Dependency Check**: Update any plugins that may not support API 35
4. **Functional Test**: Test core app functionality on Android 15 devices/emulator
5. **Play Console**: Upload new APK to Google Play Console for validation

## Potential Issues to Watch For

- Plugin compatibility with Android 15
- Permission changes in Android 15
- Behavioral changes in newer Android versions
- Network security config requirements

## Verification Commands

```bash
# In android/ directory:
./gradlew build --info

# In project root (after Flutter setup):
flutter clean
flutter pub get
flutter build apk --release
```