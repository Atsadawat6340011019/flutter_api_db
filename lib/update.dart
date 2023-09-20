import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 221, 221),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('หน้าแก้ไขข้อมูล',
            style: TextStyle(
              fontSize: 25,
            ),),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: TextFormField(
                controller: fullname,
                decoration: InputDecoration(
                  hintText: "Enter your Fullname",
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: TextFormField(
                controller: repassword,
                decoration: InputDecoration(
                  hintText: "Enter your Re-Password",
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.blue.withOpacity(0.12);
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Update')),
                    TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.blue.withOpacity(0.12);
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Cancle')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
