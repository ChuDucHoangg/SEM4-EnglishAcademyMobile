class TestOnlineModel {
  final int id;
  final String title;
  final String slug;
  final int type;
  final String description;
  final int time;
  final int totalQuestion;
  final List<TestOnlineSessionDetails> testOnlineSessionDetails;

  TestOnlineModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.type,
    required this.description,
    required this.time,
    required this.totalQuestion,
    required this.testOnlineSessionDetails,
  });

  factory TestOnlineModel.fromJson(Map<String, dynamic> json) {
    var list = json['testOnlineSessionDetails'] as List;
    List<TestOnlineSessionDetails> sessionDetailsList =
    list.map((i) => TestOnlineSessionDetails.fromJson(i)).toList();

    return TestOnlineModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      type: json['type'],
      description: json['description'],
      time: json['time'],
      totalQuestion: json['totalQuestion'],
      testOnlineSessionDetails: sessionDetailsList,
    );
  }
}

class TestOnlineSessionDetails {
  final int id;
  final int testInputId;
  final int sessionId;
  final String sessionName;
  final int totalQuestion;
  final List<QuestionTestOnlineDTO> questionTestOnlineDTOs;

  TestOnlineSessionDetails({
    required this.id,
    required this.testInputId,
    required this.sessionId,
    required this.sessionName,
    required this.totalQuestion,
    required this.questionTestOnlineDTOs,
  });

  factory TestOnlineSessionDetails.fromJson(Map<String, dynamic> json) {
    var list = json['questionTestOnlineDTOS'] as List;
    List<QuestionTestOnlineDTO> questionList =
    list.map((i) => QuestionTestOnlineDTO.fromJson(i)).toList();

    return TestOnlineSessionDetails(
      id: json['id'],
      testInputId: json['testInputId'],
      sessionId: json['sessionId'],
      sessionName: json['sessionName'],
      totalQuestion: json['totalQuestion'],
      questionTestOnlineDTOs: questionList,
    );
  }
}

class QuestionTestOnlineDTO {
  final int id;
  final String title;
  final String? audiomp3;
  final String? image;
  final String? paragraph;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int type;
  final int part;
  final int orderTop;

  QuestionTestOnlineDTO({
    required this.id,
    required this.title,
    this.audiomp3,
    this.image,
    this.paragraph,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.type,
    required this.part,
    required this.orderTop,
  });

  factory QuestionTestOnlineDTO.fromJson(Map<String, dynamic> json) {
    return QuestionTestOnlineDTO(
      id: json['id'],
      title: json['title'],
      audiomp3: json['audiomp3'],
      image: json['image'],
      paragraph: json['paragraph'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      option4: json['option4'],
      type: json['type'],
      part: json['part'],
      orderTop: json['orderTop'],
    );
  }
}

// Result Test
class TestOnlineResult {
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
  bool status;
  String createdDate;
  String modifiedDate;
  String createdBy;
  String modifiedBy;

  TestOnlineResult({
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
    required this.status,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory TestOnlineResult.fromJson(Map<String, dynamic> json) {
    return TestOnlineResult(
      id: json['id'],
      code: json['code'],
      correctReading: json['correctReading'],
      correctListening: json['correctListening'],
      correctVocabulary: json['correctVocabulary'],
      correctGrammar: json['correctGrammar'],
      totalQuestionReading: json['totalQuestionReading'],
      totalQuestionListening: json['totalQuestionListening'],
      totalQuestionVocabulary: json['totalQuestionVocabulary'],
      totalQuestionGrammar: json['totalQuestionGrammar'],
      score: json['score'],
      time: json['time'],
      status: json['status'],
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
    );
  }
}
