import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapisample/Model/CreateUser.dart';

import 'Controller/connection.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({Key? key}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  String? name;
  String? job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New")),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                name = value;
              },
            ),
            TextFormField(
              onChanged: (value) {
                job = value;
              },
            ),
            ElevatedButton(onPressed: () {
              print(name);
              print(job);
              createUser(UserCreateBody(name: name, job: job)).then((value) =>
              print(value)
              ).catchError((er) {
                print(er);
              });
            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
