class SubjectOfflineModel {
  final int id;
  final String name;
  final String slug;
  final int orderTop;
  final int totalSlot;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;
  final List<dynamic> slotResponseDetailList;

  SubjectOfflineModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.orderTop,
    required this.totalSlot,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.slotResponseDetailList,
  });

  factory SubjectOfflineModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> slotResponseDetailList = json['slotResponseDetailList'] ?? [];
    return SubjectOfflineModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      orderTop: json['orderTop'] ?? 0,
      totalSlot: json['totalSlot'] ?? 0,
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
      slotResponseDetailList: slotResponseDetailList,
    );
  }
}
