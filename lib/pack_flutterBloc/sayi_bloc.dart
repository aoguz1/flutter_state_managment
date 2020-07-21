import 'package:bloc/src/bloc.dart';
import 'package:state_managment/pack_flutterBloc/sayi_event.dart';
import 'package:state_managment/pack_flutterBloc/sayi_state.dart';

class SayiPackBloc extends Bloc<SayiEvent, int> {
  SayiPackBloc() : super(0);

  @override
  @override
  Stream<int> mapEventToState(SayiEvent event) async* {
    var _currentState = state;
    if (event is UpNumber) {
      yield state + 1;
    } else if (event is DownNumber) {
      yield state - 1;
    }
  }

  void onArttir() {
    add(UpNumber());
  }

  void onAzalt() {
    add(DownNumber());
  }
}
