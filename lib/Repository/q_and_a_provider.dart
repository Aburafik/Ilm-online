import 'package:flutter/cupertino.dart';

class QuestionsAndAnswersProvider extends ChangeNotifier {
  List _questions = [];

 final List _getAllQuestions = [];

  get questions => _questions;

  get getAllQuestions => _getAllQuestions;



  addQuestion(question) {
    _getAllQuestions.add(question);
    notifyListeners();
  }
  setQuestions(List userQuestion) {
    _questions = userQuestion;
    notifyListeners();
  }
}
