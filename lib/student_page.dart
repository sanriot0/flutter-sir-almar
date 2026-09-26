import 'package:flutter/material.dart';
import 'package:flutter_firebase/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

final studentNoController = TextEditingController();
final nameController = TextEditingController();
final courseController = TextEditingController();

Future<void> createStudent() async {}

  Future<void> saveTestData(dynamic studentNoController) async {

    final studentNo = studentNoController.text.trim();
    final name = nameController.text.trim();
    final course = courseController.text.trim();

    await FirebaseFirestore.instance.collection('students').add({
      'student_no': studentNo,
      'name': name,
      'course': course,
      'createdAt': FieldValue.serverTimestamp(),
    });

    const snackBar = SnackBar(content: Text('Created successfully!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Page"),
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 15,),

            TextField(
              controller: studentNoController,
              decoration: InputDecoration(
                labelText: 'Student No.',
                border: OutlineInputBorder()
                ),
            ),

            SizedBox(height: 15,),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name.',
                border: OutlineInputBorder()
                ),
            ),

            SizedBox(height: 15,),

            TextField(
              controller: courseController,
              decoration: InputDecoration(
                labelText: 'Course.',
                border: OutlineInputBorder()
                ),
            ),

            SizedBox(height: 25,),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              onPressed: createStudent,
              child: Text('Create Student')
              )
            ),
            
            
          ],
        )
      ),
    );
  }
}
