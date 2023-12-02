import 'package:flutter/material.dart';

import 'package:test_task_space_scutum/database/database.dart';
import 'package:test_task_space_scutum/pages/lift_page.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final dbHelper = DatabaseHelper.instance;
  int floorValue = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Building>>(
      future: dbHelper.getBuildings(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Building> id = snapshot.data!;

        return Expanded(
          child: ListView.builder(
            itemCount: id.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: SizedBox(
                      width: 228,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(230, 230, 230, 1),
                        ),
                        onPressed: () {
                          floorValue = id[index].floors;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => LiftPage(
                                floorValue: floorValue,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Text(
                              'House',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 83,
                            ),
                            Text(
                              id[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
