import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:state_mng/controller.dart';
import 'package:state_mng/model.dart';

class AddData extends StatelessWidget {
  AddData({Key? key}) : super(key: key);
  AppData appData = Get.find<AppData>();
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: name,
            ),
            TextField(controller: age),
            ElevatedButton(
                onPressed: () {
                  ModelOfAppData modelOfAppData = ModelOfAppData(
                    age: age.text,
                    name: name.text,
                  );
                  appData.addContact(modelOfAppData);
                },
                child: Text('add')),
          ],
        ),
      ),
    );
  }
}
