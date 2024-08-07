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
  final String categoryName;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdBy;
  final String modifiedBy;
  final List<dynamic> reviewList;
  double calculateTotalStars() {
    double totalStars = 0;
    if (reviewList.isNotEmpty) {
      for (var review in reviewList) {
        totalStars += (review['score'] ?? 0.0);
      }
    }
    return totalStars;
  }
  final List<dynamic> topicOnlineDetailList;

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
    required this.categoryName,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.reviewList,
    required this.topicOnlineDetailList,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> reviewList = json['reviewList'] ?? [];
    final List<dynamic> topicOnlineDetailList = json['topicOnlineDetailList'] ?? [];
    return CourseModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      star: json['star']?.toDouble() ?? 0.0,
      totalReview: json['totalReview'] ?? 0,
      description: json['description'] ?? '',
      level: json['level'] ?? 0,
      language: json['language'] ?? '',
      status: json['status'] ?? 0,
      trailer: json['trailer'] ?? '',
      categoryName: json['categoryName'] ?? '',
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
      reviewList: reviewList,
      topicOnlineDetailList: topicOnlineDetailList,
    );
  }
}
