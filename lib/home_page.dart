import 'package:flutter/material.dart';
import 'video_player_page.dart'; // تأكد من استيراد الصفحة الصحيحة
import 'answer_submission_page.dart'; // تأكد من استيراد الصفحة الصحيحة

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // التنقل إلى صفحة تشغيل الفيديو
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerPage()),
                );
              },
              child: Text('Watch Videos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // التنقل إلى صفحة رفع الامتحان
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnswerSubmissionPage()),
                );
              },
              child: Text('Upload Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
