import 'package:customer_app/abstracts/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String placeHolder;
  final Function update;
  const InputField({Key key, this.placeHolder, this.update}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          gradient: color_gradient_primary,
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2)
          )],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              topRight: Radius.circular(16))
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                widget.update(value);
              },
              validator: (text) {
                if (text.length < 8) {
                  return "Mật khẩu phải có độ dài lớn hơn 8";
                }
                return null;
              },
              obscureText: hidePassword,
              decoration: new InputDecoration(
                  isDense: true,
                  // errorStyle: TextStyle(fontSize: 12, height: 1),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  enabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          topRight: Radius.circular(16))
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 14, fontWeight: FontWeight.w200)),
                  hintText: widget.placeHolder
              ),
            ),
          ),
          IconButton(
              iconSize: 22,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(0),
              icon: Icon(Icons.remove_red_eye_sharp),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              }
          ),
        ],
      ),
    );
  }
}
