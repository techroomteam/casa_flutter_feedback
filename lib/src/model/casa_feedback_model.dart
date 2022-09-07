class CasaFeedbackModel {
  String id;
  String mainQuestion;
  String subtitle;
  String okayQuestion;
  String likeQuestion;
  String dislikeQuestion;
  List<String>? points;
  bool multiSelection;
  int? userRating;
  List<String>? userPointChoice;
  String? userComment;
  CasaFeedbackModel({
    required this.id,
    required this.mainQuestion,
    required this.subtitle,
    required this.okayQuestion,
    required this.likeQuestion,
    required this.dislikeQuestion,
    this.points = const [],
    required this.multiSelection,
    this.userRating,
    this.userPointChoice,
    this.userComment,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main_question': mainQuestion,
      'sub_title': subtitle,
      'okay_question': okayQuestion,
      'like_question': likeQuestion,
      'dislike_question': dislikeQuestion,
      'points': points,
      'multi_selection': multiSelection,
      'user_rating': userRating,
      'user_point_choice': userPointChoice,
      'user_comment': userComment,
    };
  }

  CasaFeedbackModel.fromMap(map)
      : id = map['id'],
        mainQuestion = map['main_question'],
        subtitle = map['sub_title'],
        okayQuestion = map['okay_question'],
        likeQuestion = map['like_question'],
        dislikeQuestion = map['dislike_question'],
        points = map['points'],
        multiSelection = map['multi_selection'],
        userRating = map['user_rating'],
        userPointChoice = map['user_point_choice'],
        userComment = map['user_comment'];
  // CasaFeedback.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data());
}
