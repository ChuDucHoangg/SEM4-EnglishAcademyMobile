class TestInputModel {
  final int id;
  final String title;
  final String slug;
  final int type;
  final String description;
  final int totalQuestion;

  TestInputModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.type,
    required this.description,
    required this.totalQuestion,
  });

  factory TestInputModel.fromJson(Map<String, dynamic> json) {
    return TestInputModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      type: json['type'],
      description: json['description'],
      totalQuestion: json['totalQuestion'],
    );
  }
}

class TestInputDetailModel {
  final int id;
  final String title;
  final String slug;
  final int type;
  final String description;
  final int totalQuestion;
  final int time;
  final List<TestInputSession> testInputSessionDetails;
  final String createdDate;
  final String modifiedDate;
  final String createdBy;
  final String modifiedBy;

  TestInputDetailModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.type,
    required this.description,
    required this.totalQuestion,
    required this.time,
    required this.testInputSessionDetails,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory TestInputDetailModel.fromJson(Map<String, dynamic> json) {
    return TestInputDetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      type: json['type'] ?? 0,
      description: json['description'] ,
      totalQuestion: json['totalQuestion'] ?? 0,
      time: json['time'] ,
      testInputSessionDetails: (json['testInputSessionDetails'] as List<dynamic>? ?? [])
          .map((item) => TestInputSession.fromJson(item))
          .toList(),
      createdDate: json['createdDate'] ?? '',
      modifiedDate: json['modifiedDate'] ?? '',
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
    );
  }
}

class TestInputSession {
  final int id;
  final int testInputId;
  final int sessionId;
  final String sessionName;
  final int totalQuestion;
  final int orderTop;
  final List<QuestionTestInput> questionTestInputs;
  final String createdDate;
  final String modifiedDate;
  final String createdBy;
  final String modifiedBy;

  TestInputSession({
    required this.id,
    required this.testInputId,
    required this.sessionId,
    required this.sessionName,
    required this.totalQuestion,
    required this.orderTop,
    required this.questionTestInputs,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory TestInputSession.fromJson(Map<String, dynamic> json) {
    return TestInputSession(
      id: json['id'] ?? 0,
      testInputId: json['testInputId'] ?? 0,
      sessionId: json['sessionId'] ?? 0,
      sessionName: json['sessionName'] ?? '',
      totalQuestion: json['totalQuestion'] ?? 0,
      orderTop: json['orderTop'] ?? 0,
      questionTestInputs: (json['questionTestInputs'] as List<dynamic>? ?? [])
          .map((item) => QuestionTestInput.fromJson(item))
          .toList(),
      createdDate: json['createdDate'] ?? '',
      modifiedDate: json['modifiedDate'] ?? '',
      createdBy: json['createdBy'] ?? '',
      modifiedBy: json['modifiedBy'] ?? '',
    );
  }
}

class QuestionTestInput {
  final int id;
  final String title;
  final String audiomp3;
  final String image;
  final String paragraph;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int type;
  final int part;
  final int orderTop;

  QuestionTestInput({
    required this.id,
    required this.title,
    required this.audiomp3,
    required this.image,
    required this.paragraph,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.type,
    required this.part,
    required this.orderTop,
  });

  factory QuestionTestInput.fromJson(Map<String, dynamic> json) {
    return QuestionTestInput(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      audiomp3: json['audiomp3'] ?? '',
      image: json['image'] ?? '',
      paragraph: json['paragraph'] ?? '',
      option1: json['option1'] ?? '',
      option2: json['option2'] ?? '',
      option3: json['option3'] ?? '',
      option4: json['option4'] ?? '',
      type: json['type'] ?? 0,
      part: json['part'] ?? 0,
      orderTop: json['orderTop'] ?? 0,
    );
  }
}

// Learning Path
class LearningPathModel {
  int id;
  String code;
  int correctReading;
  int correctListening;
  int correctVocabulary;
  int correctGrammar;
  int totalQuestionReading;
  int totalQuestionListening;
  int totalQuestionVocabulary;
  int totalQuestionGrammar;
  double score;
  int time;
  int type;
  List<CourseSuggest> courseOnlineList;
  String createdDate;
  String modifiedDate;
  String createdBy;
  String modifiedBy;

  LearningPathModel({
    required this.id,
    required this.code,
    required this.correctReading,
    required this.correctListening,
    required this.correctVocabulary,
    required this.correctGrammar,
    required this.totalQuestionReading,
    required this.totalQuestionListening,
    required this.totalQuestionVocabulary,
    required this.totalQuestionGrammar,
    required this.score,
    required this.time,
    required this.type,
    required this.courseOnlineList,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory LearningPathModel.fromJson(Map<String, dynamic> json) {
    var courseList = json['courseOnlineList'] as List;
    List<CourseSuggest> courses = courseList.map((courseJson) => CourseSuggest.fromJson(courseJson)).toList();

    return LearningPathModel(
      id: json['id'],
      code: json['code'],
      correctReading: json['correctReading'] ?? 0,
      correctListening: json['correctListening'] ?? 0,
      correctVocabulary: json['correctVocabulary'] ?? 0,
      correctGrammar: json['correctGrammar'] ?? 0,
      totalQuestionReading: json['totalQuestionReading'] ?? 0,
      totalQuestionListening: json['totalQuestionListening'] ?? 0,
      totalQuestionVocabulary: json['totalQuestionVocabulary'] ?? 0,
      totalQuestionGrammar: json['totalQuestionGrammar'] ?? 0,
      score: json['score'],
      time: json['time'],
      type: json['type'],
      courseOnlineList: courses,
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
    );
  }
}

class CourseSuggest {
  int id;
  String name;
  String slug;
  String image;
  double price;
  double star;
  int totalReview;
  String description;
  int level;
  String language;
  int status;
  String trailer;
  int categoryId;
  String createdDate;
  String modifiedDate;
  String createdBy;
  String modifiedBy;

  CourseSuggest({
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
    required this.categoryId,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory CourseSuggest.fromJson(Map<String, dynamic> json) {
    return CourseSuggest(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      price: json['price'],
      star: json['star'],
      totalReview: json['totalReview'],
      description: json['description'],
      level: json['level'],
      language: json['language'],
      status: json['status'],
      trailer: json['trailer'],
      categoryId: json['category_id'],
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
    );
  }
}


// Answers Detail
class AnswersDetailModel {
  final int id;
  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String answerCorrect;
  final String answerForStudent;
  final bool result;

  AnswersDetailModel({
    required this.id,
    required this.title,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answerCorrect,
    required this.answerForStudent,
    required this.result,
  });

  factory AnswersDetailModel.fromJson(Map<String, dynamic> json) {
    return AnswersDetailModel(
      id: json['id'],
      title: json['title'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      option4: json['option4'],
      answerCorrect: json['answerCorrect'],
      answerForStudent: json['answerForStudent'],
      result: json['result'],
    );
  }
}