import 'package:flutter/material.dart';

class ColumnSpace extends StatelessWidget {

  ColumnSpace(this.height, { Key? key }) : super(key: key);

  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}

class RowSpace extends StatelessWidget {

  RowSpace(this.width, { Key? key }) : super(key: key);

  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}