import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_mng/add.dart';
import 'package:state_mng/controller.dart';
import 'package:state_mng/model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  AppData appData = Get.put(AppData(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: appData.contact.length,
                itemBuilder: (_, i) {
                  ModelOfAppData data = appData.contact[i];
                  return ListTile(
                    leading: CircleAvatar(),
                    trailing: Text(data.age!),
                    title: Text(data.name!),
                  );
                },
              );
            }),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => AddData());
              },
              child: Text('add')),
        ],
      ),
    );
  }
}
