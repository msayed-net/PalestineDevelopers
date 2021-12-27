# palestine_first_run

Lightweight and easy check if the app runs for its first time, apply that to custom calls.

[![License](https://img.shields.io/github/license/msayed-net/PalestineDevelopers)](https://github.com/msayed-net/PalestineDevelopers)
[![Pub](https://img.shields.io/badge/Palestine%20First%20Run-pub-blue)](https://pub.dev/packages/palestine_first_run)
[![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/palestine_first_run/example)

Part of PalestineDevelopers project

[![Fork](https://img.shields.io/github/forks/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)
[![Star](https://img.shields.io/github/stars/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)
[![Watch](https://img.shields.io/github/watchers/msayed-net/PalestineDevelopers?style=social)](https://github.com/msayed-net/PalestineDevelopers)  

## Features

* Check app is @ first run
* Check custom actions is @ first call

## Getting started

To start, import package

```dart
import 'package:palestine_first_run/palestine_first_run.dart';
```

## Usage

Ensure flutter framework is active

* Add this to the beginning of `main()`

```dart
// Make Sure Framework Is Ready
WidgetsFlutterBinding.ensureInitialized();
```

Just as easy as this

```dart
// First time (true), then (false)
final bool isFirstRun = await PalFirstRun.isFirstRun();
```

And for the custom calls

```dart
// First time (true), then (false)
final bool isFirstAPICall = await PalFirstRun.isFirstCall('call_api');
```
