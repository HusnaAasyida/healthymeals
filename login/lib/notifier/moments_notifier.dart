import 'dart:collection';

import 'package:login/models/moments.dart';
import 'package:flutter/cupertino.dart';

class MomentsNotifier with ChangeNotifier {
  List<Moments> _momentsList = [];
  Moments _currentMoments;

  UnmodifiableListView<Moments> get momentsList =>
      UnmodifiableListView(_momentsList);

  Moments get currentMoments => _currentMoments;

  set momentsList(List<Moments> momentsList) {
    _momentsList = momentsList;
    notifyListeners();
  }

  set currentMoments(Moments moments) {
    _currentMoments = moments;
    notifyListeners();
  }

  addMoments(Moments moments) {
    _momentsList.insert(0, moments);
    notifyListeners();
  }

  deleteMoments(Moments moments) {
    _momentsList.removeWhere((_moments) => _moments.id == moments.id);
    notifyListeners();
  }
}
