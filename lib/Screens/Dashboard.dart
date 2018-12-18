import 'package:aiapp/Screens/ChatScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const fontFam = 'Montserrat';

  final Color prim1 = new Color(0xFF671fd0);
  final Color sec1 = new Color(0xFF2e00a1);
  final Color prim2 = new Color(0xFF2e00a1);
  final Color sec2 = new Color(0xFFFF1D61);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.indigo[10],
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        child: new Icon(Icons.chat),
        backgroundColor: new Color(0xFF671fd0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        elevation: 10.0,
        color: Colors.white,
        notchMargin: 10.0,
        shape: new CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.bubble_chart),
              color: new Color(0xFF2e00a1),
              iconSize: 28.0,
              alignment: Alignment.centerLeft,
              onPressed: () => {},
            ),
            new IconButton(
              icon: Icon(Icons.search),
              color: prim1,
              iconSize: 28.0,
              alignment: Alignment.centerLeft,
              onPressed: () => {},
            ),
          ],
        ),
      ),
      body: new Stack(children: <Widget>[
        new SafeArea(
          top: true,
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FadeAnimatedTextKit(
                      duration: Duration(milliseconds: 5000),
                      isRepeatingAnimation: false,
                      text: ["Hello Aidan!", "Good Evening", "Hi"],
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    new CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 29.0,
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  new StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => new Container(
                        color: Colors.green,
                        child: new Center(
                          child: new CircleAvatar(
                            backgroundColor: Colors.white,
                            child: new Text('$index'),
                          ),
                        )),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
