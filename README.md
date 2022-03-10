<p align="center">
  <img width="400" src="assets/icon/rainfall_transparent.png" />
</p>

# Rainfall Cloud Client

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

## Rebuild stores

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
