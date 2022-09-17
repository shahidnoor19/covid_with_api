import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //For SignUp
  //  void login({String? email, String? password}) async {
  //   try {
  //     Response response =
  //         await post(Uri.parse('https://reqres.in/api/register'), body: {
  //       'email': email,
  //       'password': password,
  //     });
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       print(data);
  //       print('Account Created Successfully');
  //     } else {
  //       print('Failed');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //For login
  void login({String? email, String? password}) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        //for Getting data
        var data = jsonDecode(response.body);
        print(data);

        print('login Successfully');
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'password'),
          ),
          TextButton(
            onPressed: () {
              login(
                email: emailController.text,
                password: passwordController.text,
              );
            },
            child: Text('Sign In'),
            //  Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
