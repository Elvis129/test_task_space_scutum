import 'package:flutter/material.dart';

import 'package:test_task_space_scutum/pages/house_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Stack(children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Test Task',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color.fromRGBO(247, 17, 17, 1),
                  width: 1,
                )),
                child: Image.asset(
                  'assets/images/test_task_build.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 228,
                height: 57,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
                  ),
                  onPressed: () async {
                    // await clearTable();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HousePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          const Positioned(
              right: 30,
              bottom: 20,
              child: Text(
                'desinged by ...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ))
        ]),
      ),
    );
  }
}
