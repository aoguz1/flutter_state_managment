import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/pack_flutterBloc/sayi_bloc.dart';
import 'package:state_managment/pack_flutterBloc/sayi_event.dart';
import 'package:state_managment/pack_flutterBloc/sayi_state.dart';

class BlocPackageWithFlutter extends StatefulWidget {
  @override
  _BlocPackageWithFlutterState createState() => _BlocPackageWithFlutterState();
}

class _BlocPackageWithFlutterState extends State<BlocPackageWithFlutter> {
  final numberState = SayiPackBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    numberState.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SayiPackBloc>(
      create: (context) => numberState,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Package with Flutter"),
        ),
        floatingActionButton: MyFloatingButton(),
        body: BlocPackBody(),
      ),
    );
  }
}

class BlocPackBody extends StatelessWidget {
  const BlocPackBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumberState();
  }
}

class NumberState extends StatelessWidget {
  const NumberState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SayiPackBloc>(context);

    return Container(
        child: BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        return Center(
            child: Text(
          "${state.toString()}",
          style: Theme.of(context).textTheme.headline4,
        ));
      },
    ));
  }
}

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "arttir",
          onPressed: () {
            BlocProvider.of<SayiPackBloc>(context).add(UpNumber());
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          
          heroTag: "azalt",
          onPressed: () {
            BlocProvider.of<SayiPackBloc>(context).add(DownNumber());
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
