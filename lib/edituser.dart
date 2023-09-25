import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/home.dart';
class Edituser extends StatefulWidget {
  final List user;
  final int index;

  const Edituser({super.key, required this.user, required this.index});

  @override
  State<Edituser> createState() => __EdituserState();
}

class __EdituserState extends State<Edituser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();
  
  Future<void> editUser() async {
    final urlstr = 'http://172.21.123.162/addressbook/edit.php';
    final url = Uri.parse(urlstr);
    final response = await http.post(url, body: {
      'username': user.text,
      'password': pwd.text,
      'fullname': fullname.text,
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      //Success
      final json = response.body;
      final data = jsonDecode(json);
      debugPrint('Data: $data');
      if (data == 'Complete') {
        print('Result: $data');
      } else {
        Fluttertoast.showToast(
            msg: "Please check again",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        print('Result: $data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('Add User Form',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: fullname,
                decoration: const InputDecoration(
                  labelText: 'Fullname',
                  hintText: 'Please input fullname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fullname';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: user,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Please input username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: pwd,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Please input password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        
                      }
                    },
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Cancel'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
