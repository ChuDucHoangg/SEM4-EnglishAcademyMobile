class CourseOfflineModel {
  final int id;
  final String name;
  final String slug;
  final String image;
  final double price;
  final String description;
  final int level;
  final String language;
  final int status;
  final String trailer;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;
  final List<dynamic> subjectList;

  CourseOfflineModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.price,
    required this.description,
    required this.level,
    required this.language,
    required this.status,
    required this.trailer,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.subjectList,
  });

  factory CourseOfflineModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> subjectList = json['subjectList'] ?? [];
    return CourseOfflineModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      level: json['level'] ?? 0,
      language: json['language'] ?? '',
      status: json['status'] ?? 0,
      trailer: json['trailer'] ?? '',
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
      subjectList: subjectList,
    );
  }
}
