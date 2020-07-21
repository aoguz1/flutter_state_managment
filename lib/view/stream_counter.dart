import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounter extends StatefulWidget {
  const StreamCounter({Key key}) : super(key: key);

  @override
  _StreamCounterState createState() => _StreamCounterState();
}

class _StreamCounterState extends State<StreamCounter> {
  int _counter = 0;
  final StreamController<int> streamController = StreamController<int>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              streamController.sink.add(++_counter);
            },
            heroTag: "arttır",
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              streamController.sink.add(--_counter);
            },
            heroTag: "azalt",
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              initialData: 0,
              stream: streamController.stream,
              builder: (context, snapshot) {
                return Center(
                    child: Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
