class TopicModel {
  final String name;
  final String slug;
  final bool status;
  final int progress;
  final List<dynamic> topicOnlineDetailResponseList;

  TopicModel({
    required this.name,
    required this.slug,
    required this.status,
    required this.progress,
    required this.topicOnlineDetailResponseList,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> topicOnlineDetailResponseList = json['topicOnlineDetailResponseList'] ?? [];
    return TopicModel(
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      status: json['status'] ?? false,
      progress: json['progress'] ?? 0,
      topicOnlineDetailResponseList: topicOnlineDetailResponseList,
    );
  }
}
