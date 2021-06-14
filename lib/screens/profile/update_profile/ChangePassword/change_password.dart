import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/profile/update_profile/ChangePassword/inputField.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  final String customerId;
  const ChangePassword({Key key, this.customerId}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String oldPassword, newPassword, newPasswordCf;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15, bottom: MediaQuery.of(context).viewInsets.bottom + 15, right: 12, left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: color_gradient_primary,
        ),
        // height: 350,
        child: Form(
          key: _form,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text("Thay đổi mật khẩu",
                        style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 22))),
                  ),
                  InputField(placeHolder: "Nhập mật khẩu cũ", update: (value) {
                    setState(() {
                      oldPassword = value;
                    });
                  },),
                  InputField(placeHolder: "Nhập mật khẩu mới", update: (value) {
                    setState(() {
                      newPassword = value;
                    });
                  },),
                  InputField(placeHolder: "Nhập lại mật khẩu mới", update: (value) {
                    setState(() {
                      newPasswordCf = value;
                    });
                  },),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              gradient: LinearGradient(
                                  begin: Alignment(-0.75, 0),
                                  end: Alignment(0.5, 0),
                                  colors: [const Color(0x66FFFFFF), const Color(0x6FB6F492)]),
                              boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 2)
                              )]
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // FocusScope.of(context).requestFocus(new FocusNode())
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                elevation: 0,
                                primary: Colors.transparent,
                                padding: EdgeInsets.all(0),onPrimary: Colors.black,
                                shadowColor: Colors.transparent
                            ),
                            child: Text('Huỷ',
                              style: Theme.of(context).textTheme.headline6.merge(
                                  TextStyle(fontSize: 16, color: Colors.black)),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              gradient: color_gradient_primary,
                              boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 2)
                              )]
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              final isValid = _form.currentState.validate();
                              if (!isValid ) {
                                return;
                              }
                              else if(newPassword != newPasswordCf) {
                                showDialog(
                                    barrierDismissible: false,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext builderContext) {
                                      Future.delayed(Duration(seconds: 1), () {
                                        Navigator.of(builderContext).pop();
                                      });
                                      return AlertDialog(
                                          backgroundColor: Colors.black.withOpacity(0.8),
                                          content: Text('Mật khẩu không trùng khớp', style: TextStyle(color: Colors.white)),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                      );
                                    }
                                );
                              }
                              else {
                                dio.post("$api_url/customer/${widget.customerId}/update/password", data: {
                                  "oldPassword": oldPassword,
                                  "newPassword": newPassword
                                }).then((value) {
                                  if(value.data["success"]){
                                    showDialog(
                                        barrierDismissible: false,
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (BuildContext builderContext) {
                                          Future.delayed(Duration(milliseconds: 1000), () {
                                            Navigator.of(builderContext).pop();
                                            Navigator.of(context).pop();
                                          });
                                          return AlertDialog(
                                              backgroundColor: Colors.black.withOpacity(0.8),
                                              content: Text('Đổi mật khẩu thành công', style: TextStyle(color: Colors.white)),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                          );
                                        }
                                    );
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                elevation: 0,
                                primary: Colors.transparent,
                                padding: EdgeInsets.all(0),
                                onPrimary: Colors.black,
                                shadowColor: Colors.transparent
                            ),
                            child: Text('Lưu',
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16, color: Colors.white)),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
