import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learnapi/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetUser extends StatelessWidget {
  GetUser({Key? key}) : super(key: key);
  List<UserModel> userModelList = [];
  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        userModelList.add(UserModel.fromJson(i));
      }
      return userModelList;
    } else {
      return userModelList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex JSON'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snaphsot) {
                if (!snaphsot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: userModelList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReUsableRow(
                              name: 'Name',
                              text: snaphsot.data![i].name,
                            ),
                            ReUsableRow(
                              name: 'City',
                              text: snaphsot.data![i].address!.geo!.lat,
                            ),
                          ],
                        ),
                      ),
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

class ReUsableRow extends StatelessWidget {
  ReUsableRow({Key? key, this.name, this.text}) : super(key: key);
  String? text, name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name!),
        Text(
          text!,
        ),
      ],
    );
  }
}
