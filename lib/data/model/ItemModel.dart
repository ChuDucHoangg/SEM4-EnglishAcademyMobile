class ItemModel {
  final int id;
  final String title;
  final String slug;
  final String courseSlug;
  final String content;
  final int itemType;
  final int orderTop;
  final String pathUrl;
  final bool status;
  final List<dynamic> questionItemOnlineDTOList;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  ItemModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.courseSlug,
    required this.content,
    required this.itemType,
    required this.orderTop,
    required this.pathUrl,
    required this.status,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.questionItemOnlineDTOList,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> questionItemOnlineDTOList = json['questionItemOnlineDTOList'] ?? [];
    return ItemModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      courseSlug: json['courseSlug'] ?? '',
      content: json['content'] ?? '',
      itemType: json['itemType'] ?? 0,
      orderTop: json['orderTop'] ?? 0,
      pathUrl: json['pathUrl'] ?? '',
      status: json['status'] ?? '',
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
      questionItemOnlineDTOList: questionItemOnlineDTOList,
    );
  }
}
