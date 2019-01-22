import 'package:example/long_description.dart';
import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stretchy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Samples(),
    );
  }
}

class Samples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleStretchy1(),
                ));
              },
              child: Text("Sample 1"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleStretchy2(),
                ));
              },
              child: Text("Sample 2"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleStretchy3(),
                ));
              },
              child: Text("Sample 3"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleStretchy4(),
                ));
              },
              child: Text("Sample 4"),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

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
          child: Text(LONG_DESCRIPTION),
        ),
      ),
    );
  }
}

class SampleStretchy4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader(
        headerHeight: 250.0,
        header: GestureDetector(
          onTap: () {
            print("tap header");
          },
          child: Image.asset(
            "images/machu.jpg",
            fit: BoxFit.cover,
          ),
        ),
        highlightHeaderAlignment: HighlightHeaderAlignment.center,
        highlightHeader: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              print("tap highlightHeader");
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text("M"),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(LONG_DESCRIPTION),
        ),
      ),
    );
  }
}
