part of 'facts_cat_bloc.dart';

@immutable
abstract class FactsCatState {}

class FactsCatInitial extends FactsCatState {}

class FactsCatLoading extends FactsCatState {}

class FactsCatError extends FactsCatState {
  final String error;
  FactsCatError(this.error);
}

class FactsCatSuccess extends FactsCatState {
  final CatFactsInfoModel infoCat;
  FactsCatSuccess({
    required this.infoCat,
  });
}

class FactsHistoryLoading extends FactsCatState {}

class FactsHistoryError extends FactsCatState {
  final String error;
  FactsHistoryError({required this.error});
}

class FactsHistorySuccess extends FactsCatState {
  final List<FactsHistory> history;
  FactsHistorySuccess({required this.history});
}
