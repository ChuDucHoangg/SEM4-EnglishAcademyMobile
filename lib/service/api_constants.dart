class ApiConstants {
  static const String baseUrl = "http://localhost:8080/api/v1";

  static const String courseOnline = "/any/course-online";
  static const String courseDetail = "/any/course-online/detail";
  static const String topicOnline = "/topic-online";
  static const String itemOnline = "/item-online";
  static const String exercise = "/topic-online";
  static const String buyCourse = "/course-online-student";
  static const String checkCourseStudent = "/course-online-student/check";

  static const String courseOfflineStudent = "/course-offline/get-by-class";
  static const String courseOfflineDetailStudent = "/course-offline/detail";
  static const String courseOfflineSubjectDetailStudent = "/subject/detail";
  static const String courseOfflineItemSlotStudent = "/item-slot";
  static const String createAnswerItemSlotStudent = "/answer-student-item-slot";
  static const String testOnline = "/test-online/detail";
  static const String resultTestOnline = "/test-online/result";

  static const String entranceTest = "/test-input";
  static const String entranceTestDetail = "/test-input/detail";
  static const String learningPaths = "/test-input/result";
  static const String answersDetail = "/test-input/result-detail";

  static const String registerStudent = "/auth/student/signup";
  static const String loginStudent = "/auth/student/signip";
}
