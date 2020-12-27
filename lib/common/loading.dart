import 'package:flutter/material.dart';

/// Loading widget to use with FutureBuilder and StreamBuilder
class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
