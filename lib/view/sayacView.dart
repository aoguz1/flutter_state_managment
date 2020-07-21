import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/provider/sayac.dart';

class SayacView extends StatelessWidget {
  const SayacView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myState = Provider.of<Sayac>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayaç View"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                myState.sayi.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              heroTag: "arttir",
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                myState.arttir();
              }),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: "azalt",
              child: Icon(Icons.arrow_downward),
              onPressed: () {
                myState.azalt();
              })
        ],
      ),
    );
  }
}
