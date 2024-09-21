class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

class Video {
  final String title;
  final String url;

  Video({required this.title, required this.url});
}

class Answer {
  final String studentName;
  final String imageUrl;

  Answer({required this.studentName, required this.imageUrl});
}
