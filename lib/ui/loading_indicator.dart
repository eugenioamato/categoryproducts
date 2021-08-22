import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final strokeWidth;
  const LoadingIndicator({Key? key, this.strokeWidth}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
