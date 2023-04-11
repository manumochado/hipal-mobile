# hipal

A new Flutter project.

## Recommendations

- Flutter 2.10.1
- Android Studio Bumblebee (2021.1.1)
- Java >= 8
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## After cloning this Repository

## Build Android App and iOS

Add the following content to `android/key.properties`

```properties
storePassword=<password>
keyPassword=<password>
keyAlias=<alias>
storeFile=<path to .jks file>
```
> Note: To sign the app to be uploaded to the store, you need download these files, including the keystore, from our KeyStore Passwords (lastpass).

### set app version

Set the version in the `pubsec.yaml`:
```yaml
# version: X.X.X+<build number>
version: 1.2.3+9
```
### Android - Build for release
```bash
flutter build appbundle --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16  
flutter build apk --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
```
### iOS - Build for release
```bash
flutter build ipa --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
```
### Android - Build for profile
```bash
flutter build appbundle  --profile --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
flutter build apk --profile--dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
```
### iOS - Build for profile
```bash
flutter build ipa --profile--dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
```
### Android - Build for debug
```bash
flutter build appbundle --debug --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
flutter build apk --debug --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
```
### iOS - Build for debug
```bash
flutter build ipa --debug --dart-define=ENVIRONMENT=<PROD,STAGING,DEV> --build-number=18 --build-name=0.1.16
```
