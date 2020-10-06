import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'Repo/IntlRepo.dart';

class IntlBloc extends Bloc<IntlEvent, IntlState> {
  @override
  IntlState get initialState => InitialIntlState();

  IntlRepo intlRepo = new IntlRepo();



  @override
  Stream<IntlState> mapEventToState(
    IntlEvent event,
  ) async* {
    if (event is ChangeToCHTEvent) {

      intlRepo.ChangeToCHT();

    }
    if (event is ChangeToENGEvent) {

      intlRepo.ChangeToEN();

    }
  }
}
