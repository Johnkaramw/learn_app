import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'models.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  bool _isControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    Video newVideo = Video(
      title: 'Sample Video',
      url: 'https://www.example.com/sample_video.mp4',
    );
    _controller = VideoPlayerController.network(newVideo.url)
      ..initialize().then((_) {
        setState(() {
          _isControllerInitialized = true; // تأكدنا من التهيئة
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Stack(
        children: [
          _isControllerInitialized // تحقق من التهيئة قبل العرض
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Center(child: CircularProgressIndicator()),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Watermark',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          _isControllerInitialized // تأكد من التهيئة قبل تفعيل الزر
              ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                )
              : null, // إذا لم يتم التهيئة، لا يظهر الزر
    );
  }
}
