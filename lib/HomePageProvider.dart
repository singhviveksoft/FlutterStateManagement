import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:state_mangement_provider/utils/shared_pref.dart';

class HomePageProvider with ChangeNotifier {
  var user_age;
  bool? can_vote;
  String? eligiable = 'no data';
  String? local = 'no';
  final StreamController _controller = StreamController();

  StreamController get controller => _controller;

  void getAge(int age) async {
    if (age >= 18) {
      can_vote = true;
      eligiable = 'Can Vote';
      SharedPref().addIntToSF(age);

      user_age = await SharedPref().getIntValuesSF('intValue');
      //stream-----
      _controller.sink.add(user_age);
      print("check1 stram value -${user_age.toString()}");
      notifyListeners();
    } else {
      can_vote = false;
      eligiable = 'Cannot Vote';
      SharedPref().addIntToSF(age);
      user_age = await SharedPref().getIntValuesSF('intValue');
      _controller.sink.add(user_age);
      print("check2 stram value -${user_age.toString()}");
      notifyListeners();
    }
  }
}
