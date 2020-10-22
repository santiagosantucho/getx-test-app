import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_app/task_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Test App'),
      ),
      body: Column(
        children: [
          TasksPanel(),
          CounterPanel(),
          ResultPanel(),
        ],
      ),
    );
  }
}

class TasksPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              onPressed: () => Get.find<TaskController>().incTask1(),
              child: Text('Task 1'),
              color: Colors.white,
            ),
            FlatButton(
              onPressed: () => Get.find<TaskController>().incTask2(),
              child: Text('Task 2'),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

}

class CounterPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GetX<TaskController>(
                builder: (controller) {
                  if (controller.task1InProgress.value) {
                    return Expanded(
                      child: Container(
                        color: controller.color1.value,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        color: controller.color1.value,
                        child: Center(
                          child: Text('Task 1 count is ' + controller.count1.value.toString()),
                        ),
                      ),
                    );
                  }
                },
              ),
              GetX<TaskController>(
                builder: (controller) {
                  if (controller.task2InProgress.value) {
                    return Expanded(
                      child: Container(
                        color: controller.color2.value,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        color: controller.color2.value,
                        child: Center(
                          child: Text('Task 2 count is ' + controller.count2.value.toString()),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class ResultPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<TaskController>(
        builder: (controller) {
          return Container(
            color: Colors.grey,
            child: Center(
              child: Text('Task 1 count + Task 2 count is ' + (controller.count1.value + controller.count2.value).toString()),
            ),
          );
        },
      ),
    );
  }

}
