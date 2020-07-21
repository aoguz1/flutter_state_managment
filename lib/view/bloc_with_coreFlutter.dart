import 'package:flutter/material.dart';
import 'package:state_managment/bloc/sayac_bloc.dart';
import 'package:state_managment/bloc/sayac_event.dart';

class BlocWithFlutter extends StatefulWidget {
  @override
  _BlocWithFlutterState createState() => _BlocWithFlutterState();
}

class _BlocWithFlutterState extends State<BlocWithFlutter> {
  final _sayacBlocObj = SayacBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "arttir",
            onPressed: () {
              _sayacBlocObj.sayacEventSink.add(SayacArttir());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "azalt",
            onPressed: () {
              _sayacBlocObj.sayacEventSink.add(SayacAzalt());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Bloc with Flutter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            },
            initialData: 0,
            stream: _sayacBlocObj.sayacState,
          )
        ],
      ),
    );
  }
}
