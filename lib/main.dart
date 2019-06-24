import 'dart:io';

import 'package:flutter/material.dart';

import 'package:admob_flutter/admob_flutter.dart';

void main() {
  Admob.initialize(getAppId());
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Admob test",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter admob test"),
        ),
        body: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    final int size = 10;

    List<Widget> _children = List<Widget>.generate(
      size,
      (int index) => _buildListItem(text: "Index: $index"),
    );

    _children.insert(
      2,
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: ClipRRect( // rounded corners ad.
          borderRadius: BorderRadius.circular(40.0),
          child: AdmobBanner(
            adUnitId: getBannerAdUnitId(),
            adSize: AdmobBannerSize.LEADERBOARD,
          ),
        ),
      ),
    );

    return ListView(
      children: _children,
    );
  }

  Widget _buildListItem({String text}) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Card(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              Text(
                "This is a test widget.",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544~1458002511';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544~3347511713';
  }
  return null;
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}
