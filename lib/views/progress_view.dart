import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(child: CircularProgressIndicator(strokeWidth: 2.0,),));
  }
}