## Flutter Flip Card View

Flutter Flip Card View is a reusable Flutter widget that provides a smooth 3D card flip animation, similar to a playing card.

It helps you avoid writing complex animation logic and easily adds interactive flip cards to your apps.

---------------------------------

## Feature Preview

- Front ↔ Back flip like a playing card
- Horizontal & Vertical flip
- Smooth 3D rotation (Matrix4)
- Tap to flip
- Realistic shadow & depth
- Fully reusable widget
- User-controlled direction

----------------------------------

## Preview

https://github.com/user-attachments/assets/21d5b50a-dda4-4868-905e-5e6f819dd5fc

----------------------------------

📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
  flutter_flip_card_view:
    git:
      url: https://github.com/Excelsior-Technologies-Community/flutter_flip_card_view.git
```
Then run:
```
flutter pub get
```
----------------------------------
## File Structure
```
flutter_flip_card_view/
│
├─ lib/
│   ├─ flutter_flip_card_view.dart   # Main library file
│   │
│   └─ src/
│       ├─ flip_card_view.dart       # Core FlipCard widget
│       └─ flip_direction.dart       # Horizontal / Vertical enum
│
├─ example/
│   └─ main.dart                     # Example usage
│
├─ pubspec.yaml
├─ README.md
└─ LICENSE
```
------------------------------------------
## Usage
```
import 'package:flutter/material.dart';
import 'package:flutter_flip_card_view/flutter_flip_card_view.dart';
import 'package:flutter_flip_card_view/src/flip_direction.dart';

class FlipDemo extends StatelessWidget {
  const FlipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlipExample(),
    );
  }
}

class FlipExample extends StatelessWidget {
  const FlipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlipCardView(
          direction: FlipDirection.horizontal,
          front: Card(
            child: SizedBox(
              width: 200,
              height: 300,
              child: Center(child: Text("FRONT")),
            ),
          ),
          back: Card(
            child: SizedBox(
              width: 200,
              height: 300,
              child: Center(child: Text("BACK")),
            ),
          ),
        ),
      ),
    );
  }
}
```
--------------------------------------------
## FlipCardView Properties

| Property    | Type          | Required | Default    | Description                            |
| ----------- | ------------- | -------- | ---------- | -------------------------------------- |
| `front`     | Widget        | Yes      | —          | Front side of the card                 |
| `back`      | Widget        | Yes      | —          | Back side of the card                  |
| `direction` | FlipDirection | No       | horizontal | Flip direction (horizontal / vertical) |
| `duration`  | Duration      | No       | 600ms      | Animation speed                        |

-------------------------------------------

## FlipDirection Enum
```
enum FlipDirection {
  horizontal,
  vertical,
}
```
------------------------------------------

## How Flip Animation Works
```
This package uses Flutter’s 3D transform system:

Matrix4.identity()
  ..setEntry(3, 2, 0.001)
  ..rotateY(angle)
```
-----------------------------------------
## MIT License
```
Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this Flutter Flip Card View library and associated documentation files
(the “Software”), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY...
```
