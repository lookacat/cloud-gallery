# Rainfall - Cloud Client [experimental]

<p align="center">
  <img width="400" src="assets/icon/rainfall_transparent.png" />
</p>
<p align="center">
  <img width="400" src="assets/screenshots/screen1.png" />
</p>

Work in progress. Experimenting with flutter openid and webdav.

## Install flutter

MacOS:

1. Download latest https://docs.flutter.dev/get-started/install/macos
2. Unzip to /Users/{you}/flutter
3. nano .bash_profile or .zshrc
4. ```
   export PATH=$HOME/flutter/bin:$PATH
   ```

## Getting Started

```bash
flutter pub get
flutter run
```

## Use on Desktop
```bash
flutter config --enable-macos-desktop
```

## Rebuild stores

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
