import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String cTitle;
  final Color cColor;
  final String cId;

  const CategoryItem(this.cId, this.cTitle, this.cColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: cColor, borderRadius: BorderRadius.circular(15)),
        child: Text(
          cTitle,
        ));
  }
}
