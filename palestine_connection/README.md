# palestine_connection

Simple internet connection checker, Try to lookup Google base domain.

[![Pub](https://img.shields.io/badge/Palestine%20Connection-pub-blue)](https://pub.dev/packages/palestine_connection)
[![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/palestine_connection#-example-tab-)

Part of PalestineDevelopers project

[![Fork](https://img.shields.io/github/forks/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers/fork)
[![Star](https://img.shields.io/github/stars/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers/stargazers)
[![Watch](https://img.shields.io/github/watchers/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers/)  

## Features

* Periodic internet connection tests
* dispose method

## Getting started

To start, import package

```dart
import 'package:palestine_connection/palestine_connection.dart';
```

## Usage

Just as easy as this

```dart
final PalestineConnection connection = PalestineConnection();
connection.initialize(
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
    periodicInSeconds: 3, // 3 seconds
    onConnectionLost: () {
      // No Internet
    },
    onConnectionRestored: () {
      // Internet is back
    },
  ); // 3 seconds
```

Then you could dispose it

```dart
connection.dispose();
```
