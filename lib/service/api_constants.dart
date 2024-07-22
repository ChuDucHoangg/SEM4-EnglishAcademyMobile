class ApiConstants {
  static const String baseUrl = "http://localhost:8080/api/v1";
  // static const String baseUrl = "http://171.229.108.37:8080/api/v1";

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
  static const String certificateOnline = "/certificate-online/complete-course";

  static const String tutorList = "/any/tutor";
  static const String tutorDetail = "/any/tutor-detail";
  static const String packageTutor = "/any/package/by-tutor";
  static const String availabilityTutor = "/any/availability";
  static const String createBooking = "/booking";

  static const String entranceTest = "/any/test-input";
  static const String entranceTestDetail = "/any/detail";
  static const String entranceTestSubmit = "/detail";
  static const String learningPaths = "/result";
  static const String answersDetail = "/result-detail";

  static const String bookingList = "/student/booking";
  static const String bookingDetail = "/student/booking";
  static const String checkStudent = "/lession-booking/detail/check";

  static const String registerStudent = "/auth/student/signup";
  static const String loginStudent = "/auth/student/signip";
  static const String changePassword = "/student/change-password";

  static const String profile ="/student/profile";
  static const String updateProfile ="/student/update-profile";
}
