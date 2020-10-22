import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class TaskController extends GetxController {

  var color1 = Color.fromRGBO(0, 0, 255, 1).obs;
  var color2 = Color.fromRGBO(0, 255, 0, 1).obs;
  var count1 = 0.obs;
  var count2 = 0.obs;
  var task1InProgress = false.obs;
  var task2InProgress = false.obs;

  void incTask1() async {
    task1InProgress.value = true;
    await Future.delayed(Duration(seconds: 1), () => task1InProgress.value = false);
    count1.value++;
    color1.value = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }

  void incTask2() async {
    task2InProgress.value = true;
    await Future.delayed(Duration(seconds: 2), () => task2InProgress.value = false);
    count2.value++;
    color2.value = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }

}