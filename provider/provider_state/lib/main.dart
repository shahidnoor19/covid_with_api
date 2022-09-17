import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/count_provider.dart';
import 'package:provider_state/provider/multip_provider_example.dart';
import 'package:provider_state/views/home_page2.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => MultipleProviderExample()),
      ],
      child: MaterialApp(
        home: HomePage2(),
      ),
    );
  }
}
