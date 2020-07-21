import 'dart:async';

import 'package:state_managment/bloc/sayac_event.dart';
import 'package:state_managment/provider/sayac.dart';

class SayacBloc {
  int _sayac = 0;

/* 




event ->  BLOC -> state

event ve stateler için streamControllerler oluşturacağız.
oluşturduğumz stream controllerlar için sink ve streamları için getterlarını oluşturmayalıyız.

daha sonra event bölümündeki streamı dinliyoruz.

ilgili işlemleri yapıp state bölümünün sinkine ekliyoruz.



  */

//event için stream controller
  final _sayacEventStreamController = StreamController<SayacEvent>();
  StreamSink<SayacEvent> get sayacEventSink => _sayacEventStreamController.sink;
  Stream<SayacEvent> get _sayacEventStream =>
      _sayacEventStreamController.stream;
// state için stream controller
  final _sayacStateStreamController = StreamController<int>();
  StreamSink<int> get _sayacStateSink => _sayacStateStreamController.sink;
  Stream<int> get sayacState => _sayacStateStreamController.stream;

  SayacBloc() {
    _sayacEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(SayacEvent event) {
    if (event is SayacArttir) {
      _sayac++;
    } else {
      _sayac--;
    }
    _sayacStateSink.add(_sayac);
  }
}
