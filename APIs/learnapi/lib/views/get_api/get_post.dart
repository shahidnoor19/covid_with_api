import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnapi/models/post_model.dart';

class GetPost extends StatelessWidget {
  GetPost({Key? key}) : super(key: key);
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final Response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostModel.formJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, i) {
                    return Text(postList[i].userId.toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
