import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // تأكد من وجود هذا الاستيراد
import 'models.dart'; // تأكد من وجود هذا الملف
import 'dart:io';

class AnswerSubmissionPage extends StatefulWidget {
  @override
  _AnswerSubmissionPageState createState() => _AnswerSubmissionPageState();
}

class _AnswerSubmissionPageState extends State<AnswerSubmissionPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = pickedImage;
      });
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Answer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_image != null) {
                  Answer answer = Answer(
                    studentName: 'John Doe',
                    imageUrl: _image!.path,
                  );
                  print(
                      "Answer submitted: ${answer.studentName}, ${answer.imageUrl}");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Please select an image to submit.')),
                  );
                }
              },
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
