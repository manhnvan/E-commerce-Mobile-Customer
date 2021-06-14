import 'package:flutter/material.dart';

class InlineEditText extends StatefulWidget {
  final String initValue;
  final String title;
  final Function onSubmit;

  const InlineEditText({Key key, this.initValue, this.onSubmit, this.title}) : super(key: key);

  @override
  _InlineEditTextState createState() => _InlineEditTextState();
}

class _InlineEditTextState extends State<InlineEditText> {

  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    final String text = _textController.text.toLowerCase();
    _textController.text = widget.initValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12,10,12,10),
      decoration: BoxDecoration(
          // border: Border(
          //     bottom: BorderSide(color: Colors.black, width: 0.7)
          // )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
          SizedBox(width: 30),
          Expanded(child: EditableText(
          controller: _textController,
          autocorrect: false,
          onSubmitted: (value){
            if(value == "") {
              _textController.text = widget.initValue;
            }
            else widget.onSubmit(value);
          },
          onChanged: (value){
            if(value != "") widget.onSubmit(value);
          },
          cursorColor: Colors.black,
          textDirection: TextDirection.ltr,
          focusNode: FocusNode(),
          style: Theme.of(context).textTheme.headline6.merge(
              TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none)),
          backgroundCursorColor: Colors.amber,
          textAlign: TextAlign.end,
        )),
      ]
      ),
    );
  }
}
