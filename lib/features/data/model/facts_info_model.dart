class CatFactsInfoModel {
  final String text;
  final String createdat;
  final String updatedat;

  CatFactsInfoModel({
    required this.text,
    required this.createdat,
    required this.updatedat,
  });

  factory CatFactsInfoModel.fromMap(Map<String, dynamic> map) {
    return CatFactsInfoModel(
        text: map['text'] ?? "",
        createdat: map['createdAt'] ?? "",
        updatedat: map['updatedAt'] ?? "");
  }
}
