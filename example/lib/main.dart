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
                  builder: (context) => SampleListView(),
                ));
              },
              child: Text("ListView"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleCustomHeader(),
                ));
              },
              child: Text("Cutom header"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleBottomLabel(),
                ));
              },
              child: Text("Bottom label"),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleCenterWidget(),
                ));
              },
              child: Text("Center widget"),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class SampleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader.listViewBuilder(
        headerData: HeaderData(
          headerHeight: 250,
          header: Image.asset(
            "images/chichen.jpg",
            fit: BoxFit.cover,
          ),
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("item $index"),
            onTap: () {
              final snackBar = SnackBar(
                content: Text('item $index tapped'),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
    );
  }
}

class SampleCustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader.singleChild(
        headerData: HeaderData(
          headerHeight: 200,
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
          overlay: Align(
            alignment: Alignment.bottomRight,
            child: Material(
              color: Colors.transparent,
              child: InkResponse(
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('onTap'),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            "Hello World!",
            style: TextStyle(fontSize: 45, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SampleBottomLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader.singleChild(
        headerData: HeaderData(
          headerHeight: 250,
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
              padding: const EdgeInsets.all(15),
              child: Text(
                "Machu Picchu",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(LONG_DESCRIPTION),
        ),
      ),
    );
  }
}

class SampleCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StretchyHeader.singleChild(
        headerData: HeaderData(
          headerHeight: 250,
          header: Image.asset(
            "images/machu.jpg",
            fit: BoxFit.cover,
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
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(LONG_DESCRIPTION),
        ),
      ),
    );
  }
}
