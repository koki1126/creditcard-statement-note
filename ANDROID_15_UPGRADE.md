# Android 15 (API Level 35) Upgrade Summary

## Quick Fix for Java/Gradle Compatibility Issues

⚠️ **If you encounter "Unsupported class file major version 65" or similar errors:**

### Problem
The error occurs when old Gradle cache files (from version 6.7) conflict with newer Java versions, especially Java 21 (class file major version 65).

### Solution Steps

1. **Clear Gradle caches** (recommended first step):
   ```bash
   # On macOS/Linux:
   rm -rf ~/.gradle/caches
   rm -rf ~/.gradle/wrapper
   
   # On Windows:
   rmdir /s %USERPROFILE%\.gradle\caches
   rmdir /s %USERPROFILE%\.gradle\wrapper
   ```

2. **Regenerate Gradle wrapper** (if needed):
   ```bash
   cd android
   gradle wrapper --gradle-version 8.8
   ```

3. **Use compatible Java version**:
   - **Java 17**: Works with Gradle 7.3+ ✅
   - **Java 21**: Works with Gradle 8.5+ ✅
   
   Check your Java version: `java -version`

4. **Verify build works**:
   ```bash
   cd android
   ./gradlew build
   # OR use system gradle:
   gradle build
   ```

### Java/Gradle Compatibility Reference
| Java Version | Minimum Gradle Version | Recommended |
|--------------|-------------------------|-------------|
| Java 17      | 7.3                    | 8.5+        |
| Java 21      | 8.5                    | 8.8+        |

---

## Changes Made

This update brings the app into compliance with Google Play's requirement to target Android 15 (API level 35) by August 31, 2025.

### Configuration Updates

1. **Target API Level**: Updated from Android 11 (API 30) to Android 15 (API 35)
   - `compileSdkVersion`: 30 → 35
   - `targetSdkVersion`: 30 → 35

2. **Build Tool Upgrades**: 
   - **Android Gradle Plugin**: 4.1.0 → 8.0.2
   - **Gradle**: 6.7 → 8.8 (updated for better Java 21 support)
   - **Kotlin**: 1.6.21 → 1.8.22

3. **Performance & Compatibility**:
   - Increased JVM memory allocation: 1536M → 2048M
   - Made Flutter SDK path optional in settings.gradle
   - Added proper Gradle wrapper scripts (gradlew/gradlew.bat)

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