import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnapi/models/photo_model.dart';

class GetPhotos extends StatelessWidget {
  GetPhotos({Key? key}) : super(key: key);
  List<PhotoModel> photoList = [];
  Future<List<PhotoModel>> getPhotoApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotoModel photoModel = PhotoModel(
          title: i['title'],
          url: i['url'],
        );
        photoList.add(photoModel);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Photos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotoApi(),
              builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data![i].url.toString(),
                        ),
                      ),
                      title: Text(snapshot.data![i].title.toString()),
                    );
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
