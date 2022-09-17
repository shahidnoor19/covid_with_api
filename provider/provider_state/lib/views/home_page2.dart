import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/multip_provider_example.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Provider'),
      ),
      body: Column(
        children: [
          Consumer<MultipleProviderExample>(
            builder: (context, value, child) {
              return Slider(
                min: 0.0,
                max: 1.0,
                value: value.value,
                onChanged: (val) {
                  value.chageValue(val);
                },
              );
            },
          ),
          Consumer<MultipleProviderExample>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.pink.withOpacity(value.value),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
