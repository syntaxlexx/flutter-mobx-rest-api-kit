import 'package:flutter/material.dart';

class ViewPostScreen extends StatelessWidget {
  int? id;
  ViewPostScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Post #$id'),
      ),
      body: Center(
        child: Text('View Post'),
      ),
    );
  }
}
