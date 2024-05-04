import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:measure_size_builder/measure_size_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MeasureSizeBuilder(
          builder: (context, size) {
            log('Widget Size that changes dynamically : $size');
            return const ExpansionTile(
              title: Text('ExpansionTile'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                ListTile(
                  title: Text('This is tile number 1'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
