# palestine_connection

Lightweight internet connection test, lookup Google domain.

[![License](https://img.shields.io/github/license/msayed-net/PalestineDevelopers)](https://github.com/msayed-net/PalestineDevelopers)
[![Pub](https://img.shields.io/badge/Palestine%20Trusted%20Device-pub-blue)](https://pub.dev/packages/palestine_trusted_device)
[![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/palestine_trusted_device#-example-tab-)

Part of PalestineDevelopers project

[![Fork](https://img.shields.io/github/forks/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)
[![Star](https://img.shields.io/github/stars/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)
[![Watch](https://img.shields.io/github/watchers/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)  

## Features

* Android/IOS security checks
* dispose method

## Getting started

To start, import package

```dart
import 'package:palestine_trusted_device/palestine_trusted_device.dart';
```

## Usage

Just as easy as this

```dart
final PalestineConnection connection = PalestineConnection();
connection.initialize(
    domain: PalestineConnectionDomain.google, // Domain To Test On (optional)
    periodicInSeconds: 3, // 3 seconds
    onConnectionLost: () {
      // No Internet
    },
    onConnectionRestored: () {
      // Internet is back
    },
  );
```

It could get more easier actually

```dart
PalestineConnection().initialize(
    domain: PalestineConnectionDomain.google, // Domain To Test On (optional)
    periodicInSeconds: 3, // 3 seconds
    onConnectionLost: () {
      // No Internet
    },
    onConnectionRestored: () {
      // Internet is back
    },
  );
```

Then you could dispose it

```dart
connection.dispose();
```
