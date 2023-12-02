import 'package:flutter/material.dart';
import 'package:test_task_space_scutum/listview/lift_list_view.dart';
import 'package:test_task_space_scutum/pages/house_page.dart';

class LiftPage extends StatefulWidget {
  final int floorValue;
  const LiftPage({required this.floorValue, super.key});

  @override
  State<LiftPage> createState() => _LiftPageState();
}

class _LiftPageState extends State<LiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HousePage(),
            ),
          );
          return true;
        },
        child: Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 113,
                  ),
                  child: Text(
                    'Floors',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 9,
                left: 25,
                right: 25,
              ),
              child: Container(
                height: 1,
                color: Colors.black,
              ),
            ),
            Expanded(child: MyLiftListView(floorValue: widget.floorValue)),
          ],
        ),
      ),
    );
  }
}
