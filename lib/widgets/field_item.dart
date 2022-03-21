import 'package:flutter/material.dart';
import 'package:test_project/helpers/DBHelper.dart';

class FieldItem extends StatefulWidget {
  FieldItem(this.id, this.title, this.isTrue);

  final String id;
  final String title;
  bool isTrue;

  @override
  State<FieldItem> createState() => _FieldItemState();
}

class _FieldItemState extends State<FieldItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isTrue,
          onChanged: (val) {
            if (val == null) return;
            DBHelper.update(widget.id, val);
            setState(() {
              widget.isTrue = val;
            });
          },
        ),
        Flexible(
          child: Text(
            widget.title,
            style: Theme
                .of(context)
                .textTheme
                .subtitle2,
          ),
        ),
      ],
    );
  }
}
