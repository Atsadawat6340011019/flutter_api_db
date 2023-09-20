import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 221, 221),
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('หน้าเข้าสู่ระบบ',
              style: TextStyle(
                fontSize: 25,
              ),),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  controller: username,
                  decoration: const InputDecoration(
                    hintText: "Enter your Username",
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  controller: password,
                  decoration: const InputDecoration(
                    hintText: "Enter your Password",
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                      child: Text('Login')),
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
      ),
    );
  }
}