part of 'facts_cat_bloc.dart';

@immutable
abstract class FactsCatEvent {}

class GetFactsCat extends FactsCatEvent {}

class GetFactsHistory extends FactsCatEvent {}
