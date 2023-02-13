import 'package:flutter/material.dart';

class EditTextKanban extends StatefulWidget {
  final String title;
  final Function(String) onChangeTitle;
  final TextStyle? textStyle;
  final Color? bgColor;

  const EditTextKanban({Key? key, required this.title, required this.onChangeTitle, this.textStyle, this.bgColor}) : super(key: key);

  @override
  State<EditTextKanban> createState() => _EditTextKanbanState();
}

class _EditTextKanbanState extends State<EditTextKanban> {
  bool editing = false;
  final TextEditingController _controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: editing ? (widget.bgColor ?? Colors.grey[300]) : Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: editing
          ? Focus(
              child: SizedBox(
                child: TextField(
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  controller: _controller..text = widget.title,
                  focusNode: focusNode,
                ),
              ),
              onFocusChange: (hasFocus) {
                if (!hasFocus) {
                  setState(() {
                    widget.onChangeTitle(_controller.text);
                    this.editing = false;
                  });
                }
              },
            )
          : GestureDetector(
              child: Text(
                widget.title,
                style: widget.textStyle,
              ),
              onTap: () {
                setState(() {
                  this.editing = true;
                });
                focusNode.requestFocus();
              },
            ),
    );
  }
}
