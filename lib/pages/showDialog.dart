import 'package:flutter/material.dart';

import 'package:test_task_space_scutum/database/database.dart';

class MyShowDialog extends StatefulWidget {
  final Function update;
  const MyShowDialog({required this.update, super.key});

  @override
  State<MyShowDialog> createState() => _MyShowDialogState();
}

class _MyShowDialogState extends State<MyShowDialog> {
  final TextEditingController _textName = TextEditingController();
  final TextEditingController _textFloors = TextEditingController();

  Future<void> addHouse() async {
    int textFloorsValue = int.parse(_textFloors.text);
    await DatabaseHelper.instance.insertBuilding(
      Building(
        name: _textName.text,
        floors: textFloorsValue,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      title: Padding(
        padding: const EdgeInsets.only(
          top: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 35,
            ),
            const Text(
              'Add house',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  size: 35,
                ))
          ],
        ),
      ),
      content: SizedBox(
        height: 60,
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  'Floors count',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromRGBO(231, 230, 230, 1),
                  height: 17,
                  width: 142,
                  child: TextField(
                    controller: _textName,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Container(
                  color: const Color.fromRGBO(231, 230, 230, 1),
                  height: 17,
                  width: 37,
                  child: TextField(
                    controller: _textFloors,
                    style: const TextStyle(fontSize: 14),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        SizedBox(
          height: 24,
          width: 98,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 1, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
              ),
              onPressed: () async {
                await addHouse();
                widget.update();

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )),
        )
      ],
    );
  }
}

void myShowDialog(BuildContext context, {required Function update}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MyShowDialog(
        update: update,
      );
    },
  );
}
