import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/adduser.dart';
import 'package:rest_api/edituser.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> users = [];

 @override
  void initState(){
    getUsers();
    super.initState();
  }
Future<void> getUsers() async {
  const urlstr ="http://172.21.123.162/addressbook/select.php";

  final url = Uri.parse(urlstr);
  final response = await http.get(url);
  debugPrint('Response: $response.statusCode');
  if(response.statusCode == 200){
    //Success
    final json = response.body;
    final data = jsonDecode(json);
    debugPrint('Data: $data');
    setState(() {
      users = data;
    });

  }
  else{
    //Error
  print('error');
  }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          final user = users[index];
          final fullname = users[index]['fullname'];
          final username = users[index]['username'];
          return ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                    Edituser(
                      user: users,
                      index: index,
                    ),)
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(''),
              ),
            ),
            title: Text(username),
            subtitle: Text(fullname),
          );

        }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUser()),
          );
          
        },
        child: const Icon(
          Icons.person_add_alt_1,
          size: 30,
          color: Colors.purple,
        ),),
    );
  }
}