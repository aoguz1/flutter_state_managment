import 'package:flutter/material.dart';
import 'package:state_managment/provider/sayac.dart';
import 'package:state_managment/services/firebase_auth.dart';
import 'package:state_managment/view/bloc_packageFlutter.dart';
import 'package:state_managment/view/bloc_with_coreFlutter.dart';
import 'package:state_managment/view/provider_switch_Page.dart';
import 'package:state_managment/view/sayacView.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/provider/sayac.dart';
import 'package:state_managment/view/stream_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Sayac>(create: (context) => Sayac(0)),
        ChangeNotifierProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "Flutter State Managment"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Sayac View"),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SayacView()));
                }),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProviderSwitchPage()));
                },
                child: Text("Firebase Auth")),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StreamCounter()));
              },
              child: Text("Stream with Counter"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BlocWithFlutter()));
              },
              child: Text("Bloc with Flutter"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocPackageWithFlutter()));
              },
              child: Text("Bloc Package Flutter"),
            ),
          ],
        ),
      ),
    );
  }
}
