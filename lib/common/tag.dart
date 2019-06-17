import 'package:flutter/material.dart';
fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
//标签
class Tag extends StatelessWidget {
  final String tagname;
  const Tag(this.tagname);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullWidth(context)/27,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Text(
          tagname,
          style: TextStyle(fontSize: fullWidth(context)/43, color: Colors.red),
        ),
      ),
    );
  }
}