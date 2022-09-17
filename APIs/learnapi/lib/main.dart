import 'package:flutter/material.dart';
import 'package:learnapi/views/get_api/get_post.dart';
import 'package:learnapi/views/get_api/get_user.dart';
import 'package:learnapi/views/post_api/sign_up.dart';
import 'package:learnapi/views/post_api/upload_image.dart';

import 'views/get_api/get_photos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadImageScreen(),
    );
  }
}
