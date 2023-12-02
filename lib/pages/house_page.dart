import 'package:flutter/material.dart';
import 'package:test_task_space_scutum/listview/house_list_view.dart';
import 'package:test_task_space_scutum/pages/showDialog.dart';
import 'package:test_task_space_scutum/pages/start_page.dart';

class HousePage extends StatefulWidget {
  const HousePage({super.key});

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const StartPage(),
            ),
          );
          return true;
        },
        child: Column(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
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
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          myShowDialog(context, update: () => setState(() {}));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Add house',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 35,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ]),

            // ignore: prefer_const_constructors
            MyListView(),
          ],
        ),
      ),
    );
  }
}
