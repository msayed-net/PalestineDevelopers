# palestine_connection

Native Device security checks, Rooted/Jailbroken, Not real device, Developer mode is on, On external drive.

[![License](https://img.shields.io/github/license/msayed-net/PalestineDevelopers)](https://github.com/msayed-net/PalestineDevelopers)
[![Pub](https://img.shields.io/badge/Palestine%20Trusted%20Device-pub-blue)](https://pub.dev/packages/palestine_trusted_device)
[![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/palestine_trusted_device#-example-tab-)

Part of PalestineDevelopers project

[![Fork](https://img.shields.io/github/forks/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)
[![Star](https://img.shields.io/github/stars/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)
[![Watch](https://img.shields.io/github/watchers/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)  

## Features

* Android/IOS security checks

## Getting started

To start, import package

```dart
import 'package:palestine_trusted_device/palestine_trusted_device.dart';
```

## Usage

Just as easy as this

```dart
PalestineTrustedDevice.check(
      onFail: () {
        developer.log('Not Secure Env - Closing App..');
      },
    );
```

Customizing checks available too

```dart
PalestineTrustedDevice.check(
      checkRealDevice: true, // Android + IOS
      checkDevMode: false, // Android
      checkOnExternalStorage: false, // Android
      checkRooted: true, // Android + IOS
      onFail: () {
        developer.log('Not Secure Env - Closing App..');
      },
    );
```

It's possible to await until the check is done

```dart
await PalestineTrustedDevice.check(
      onFail: () {
        developer.log('Not Secure Env - Closing App..');
      },
    );
```
