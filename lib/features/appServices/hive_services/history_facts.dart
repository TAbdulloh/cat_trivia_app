import 'package:hive_flutter/adapters.dart';
part 'history_facts.g.dart';

@HiveType(typeId: 1)
class FactsHistory {
  FactsHistory({required this.text, required this.createdAt});
  @HiveField(0)
  String text;
  @HiveField(1)
  String createdAt;
}
