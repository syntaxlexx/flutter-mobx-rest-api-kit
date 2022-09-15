# Flutter MobX Kit TODO App
A flutter Mobx app built with 
- Mobx (State mgmt)
- Hive (fastest storage ever)
- http
- get_it (dependency injection)

![Screenshot 1](_files/screenshot.jpg)

## Dev
In order to work will stores in MobX, we are required to run an external command into the terminal which will build the store for us. The command for that is:

```bash
flutter pub run build_runner build

# stay on watch
flutter pub run build_runner watch

# Starting Clean
flutter pub run build_runner watch --delete-conflicting-outputs
```

#### Launcher Icons
```bash
flutter pub run flutter_launcher_icons:main
```

#### Updating Splash Image
Using the `flutter_native_splash` package

```bash
flutter pub run flutter_native_splash:create
```

#### Renaming package name
Rename it via

```bash
flutter pub run change_app_package_name:main com.new.package.name
```

#### Build apk
Build via commandline

```bash
flutter build apk

flutter build apk --split-per-abi
```

#### Resources
- [QuickType](https://app.quicktype.io/) - Generate classes from api response


### Going Live Checklist
- update version in pubspec.yaml
- contants > string_constants.dart
    - set appversion
    - enable bugsnag
    - set testing to false
- constants > fb_ads_constants
    - set testing to false
- constants > admob_constants
    - set testing to false

```bash
flutter build appbundle
```
[project]/build/app/outputs/bundle/release/app.aab.


### Signing App
Run command below to generate it in local folder 
```bash
keytool -genkey -v -keystore ./_files/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

## Contributing
- [Lexx YungCarter](mailto:lexxyungcarter@gmail.com)

## Issues & Pull Requests
All contributions and pull-requests are welcome.

