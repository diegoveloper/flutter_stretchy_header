# Stretchy Header

[![pub package](https://img.shields.io/pub/v/stretchy_header.svg)](https://pub.dartlang.org/packages/stretchy_header)

This package allows us to create a elastic header, to give a good effect when you scroll down the widget.

Sample 1

<p align="center">
  <img width="300" height="600" src="https://media.giphy.com/media/1hBwHq01CeFJOgJg8p/giphy.gif">
  <img width="300" height="600" src="https://media.giphy.com/media/1NUOenNf2oKU3YuWb1/giphy.gif">
  <img width="300" height="600" src="https://media.giphy.com/media/f9SzoZKqo1vfdlCaT5/giphy.gif">
</p>

Sample 2

<p align="center">
  <img width="300" height="600" src="https://media.giphy.com/media/f9SzoZKqo1vfdlCaT5/giphy.gif">
</p>

Sample 3

<p align="center">
  <img width="300" height="600" src="https://media.giphy.com/media/1NUOenNf2oKU3YuWb1/giphy.gif">
</p>

## Getting started

You should ensure that you add the router as a dependency in your flutter project.
```yaml
dependencies:
  stretchy_header: "^1.0.0"
```

You should then run `flutter packages upgrade` or update your packages in IntelliJ.

## Example Project

There is an example project in the `example` folder. Check it out. Otherwise, keep reading to get up and running.

## Usage

### Sample 1

```dart
import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

class SampleStretchy1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StretchyHeader(
          headerHeight: 250.0,
          header: Image.asset(
            "images/chichen.jpg",
            fit: BoxFit.cover,
          ),
          body: ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("item $index"),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

### Sample 2

```dart

import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

class SampleStretchy2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader(
        headerHeight: 200.0,
        backgroundColor: Colors.black54,
        blurColor: Colors.yellow,
        header: UserAccountsDrawerHeader(
          accountName: Text("Diego"),
          accountEmail: Text("twitter @diegoveloper"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.red,
            child: Text("DV"),
          ),
          margin: EdgeInsets.zero,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Hello World!",
            style: TextStyle(fontSize: 45.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
```

### Sample 3 
If you want to put a footer widget in your header that always will be visible, use headerFooter

```dart

import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

class SampleStretchy3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader(
        headerHeight: 250.0,
        header: Image.asset(
          "images/machu.jpg",
          fit: BoxFit.cover,
        ),
        highlightHeaderAlignment: HighlightHeaderAlignment.bottom,
        highlightHeader: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.black54,
              Colors.black26,
              Colors.black12,
              Colors.black12,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Machu Picchu",
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("Long text here"),
        ),
      ),
    );
  }
}

```

You can follow me on twitter [@diegoveloper](https://www.twitter.com/diegoveloper)
