import 'dart:math';

import 'package:flutter/material.dart';

import 'package:test_task_space_scutum/database/database.dart';
import 'package:test_task_space_scutum/listview/log_color.dart';

class MyLiftListView extends StatefulWidget {
  final int floorValue;
  const MyLiftListView({required this.floorValue, super.key});

  @override
  _MyLiftListViewState createState() => _MyLiftListViewState();
}

class _MyLiftListViewState extends State<MyLiftListView> {
  final dbHelper = DatabaseHelper.instance;
  int currentFloor = 1;
  int moveToFloor = 1;

  @override
  void initState() {
    super.initState();
  }

  void forMoveLift() async {}

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    while (true) {
      moveToFloor = Random().nextInt(widget.floorValue - 1) + 1;
      logInfo('Move to -> $moveToFloor');

      for (int i = currentFloor; i <= moveToFloor; i++) {
        await Future.delayed(const Duration(seconds: 1), () {
          currentFloor = i;
        });
        setState(() {});
      }
      int moveToFloor2 = moveToFloor;
      moveToFloor = 0;
      for (int i = moveToFloor2; i > 0; i--) {
        await Future.delayed(const Duration(seconds: 1), () {
          currentFloor = i;
        });
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Building>>(
      future: dbHelper.getBuildings(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: widget.floorValue,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: index + 1 == currentFloor
                        ? Colors.green
                        : index + 1 == moveToFloor
                            ? Colors.yellow
                            : const Color.fromRGBO(230, 230, 230, 1),
                    borderRadius: BorderRadius.circular(16.0),
                    border: const Border.fromBorderSide(
                        BorderSide(color: Colors.black, width: 1)),
                  ),
                  width: 228,
                  height: 40,
                  child: Center(
                    child: Text('Floor ${index + 1}'),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
