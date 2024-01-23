import 'package:bloc/bloc.dart';
import 'package:cat_trivia_app/features/appServices/hive_services/history_facts.dart';
import 'package:cat_trivia_app/features/appServices/services.dart';
import 'package:cat_trivia_app/features/data/model/facts_info_model.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:meta/meta.dart';

part 'facts_cat_event.dart';
part 'facts_cat_state.dart';

class FactsCatBloc extends Bloc<FactsCatEvent, FactsCatState> {
  FactsCatBloc() : super(FactsCatInitial()) {
    on<GetFactsCat>(_getFactsData);
    on<GetFactsHistory>(_getFactsHistory);
  }

  Future<void> _getFactsHistory(
    GetFactsHistory event,
    Emitter<FactsCatState> emit,
  ) async {
    try {
      emit(FactsHistoryLoading());
      box ??= await Hive.openBox("Facts");
      List<FactsHistory> array = [];

      box?.values.forEach((element) {
        array.add(element);
      });

      emit(FactsHistorySuccess(history: array));
    } catch (e) {
      emit(FactsHistoryError(error: e.toString()));
    }
  }

  // ignore: non_constant_identifier_names
  final _ServiceCatFacts = FactServices();
  Box? box;

  Future<void> _getFactsData(
    GetFactsCat event,
    Emitter<FactsCatState> emit,
  ) async {
    try {
      emit(FactsCatLoading());
      final facts = await _ServiceCatFacts.getFacts();
      box ??= await Hive.openBox("Facts");
      box?.add(
        FactsHistory(text: facts.text, createdAt: facts.createdat),
      );

      emit(FactsCatSuccess(infoCat: facts));
    } catch (e) {
      emit(FactsCatError(e.toString()));
    }
  }
}
