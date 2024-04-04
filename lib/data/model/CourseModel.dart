class CourseModel {
  final int id;
  final String name;
  final String slug;
  final String image;
  final double price;
  final double star;
  final int totalReview;
  final String description;
  final int level;
  final String language;
  final int status;
  final String trailer;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;

  CourseModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.price,
    required this.star,
    required this.totalReview,
    required this.description,
    required this.level,
    required this.language,
    required this.status,
    required this.trailer,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      price: json['price'].toDouble(),
      star: json['star'].toDouble(),
      totalReview: json['totalReview'],
      description: json['description'],
      level: json['level'],
      language: json['language'],
      status: json['status'],
      trailer: json['trailer'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
    );
  }
}
