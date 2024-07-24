class ItemOfflineModel {
  final int id;
  final String title;
  final String slug;
  final String content;
  final int itemType;
  final int orderTop;
  final String pathUrl;
  final DateTime startDate;
  final DateTime endDate;
  final List<dynamic> answerStudentItemSlotResponseListList;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  ItemOfflineModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.itemType,
    required this.orderTop,
    required this.pathUrl,
    required this.startDate,
    required this.endDate,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.answerStudentItemSlotResponseListList,
  });

  factory ItemOfflineModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> answerStudentItemSlotResponseListList =
        json['answerStudentItemSlotResponseListList'] ?? [];
    return ItemOfflineModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      content: json['content'] ?? '',
      itemType: json['itemType'] ?? 0,
      orderTop: json['orderTop'] ?? 0,
      pathUrl: json['pathUrl'] ?? '',
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : DateTime.now(),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : DateTime.now(),
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
      answerStudentItemSlotResponseListList:
          answerStudentItemSlotResponseListList,
    );
  }
}

class ListScoreModel {
  final int id;
  final int star1Count;
  final int star2Count;
  final int star3Count;

  ListScoreModel({
    required this.id,
    required this.star1Count,
    required this.star2Count,
    required this.star3Count,
  });

  factory ListScoreModel.fromJson(Map<String, dynamic> json) {
    return ListScoreModel(
      id: json['id'] ?? 0,
      star1Count: json['star1Count'] ?? 0,
      star2Count: json['star2Count'] ?? 0,
      star3Count: json['star3Count'] ?? 0,
    );
  }
}
