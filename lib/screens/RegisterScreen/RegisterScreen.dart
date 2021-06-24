import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/ImagePreviewer.dart';
import 'package:customer_app/components/ImageSelector.dart';
import 'package:customer_app/screens/LoginScreen/LoginScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';

class RegisterScreen extends StatefulWidget {
  static final routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullname = new TextEditingController();
  final _email = new TextEditingController();
  final _username = new TextEditingController();
  final _phoneNumber = new TextEditingController();
  final _address = new TextEditingController();
  final _password = new TextEditingController();
  final _reenterPassword = new TextEditingController();

  String thumbnail;

  var dio = Dio();

  final picker = ImagePicker();

  Future _getThumbnailAsset() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (!mounted) return;
    print(pickedFile);
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(pickedFile.path),
    });
    dio
        .post('$imgur_url',
            data: formData,
            options: Options(headers: {
              Headers.wwwAuthenticateHeader: 'Client-ID $clientId',
              'Accept': "*/*"
            }))
        .then((value) {
      if (value.data['success']) {
        dynamic data = value.data['data'];
        print(data['link']);
        setState(() {
          thumbnail = data['link'];
        });
      }
    }).catchError((e) {
      print(e.toString());
    });
  }

  // Future<void> _getThumbnailAsset() async {
  //   List<Asset> assets = await selectThumbnailImagesFromGallery();
  //   final thumbnailImage =
  //       await FlutterAbsolutePath.getAbsolutePath(assets[0].identifier);
    // if (!mounted) return;
    // print(thumbnailImage);
    // var formData = FormData.fromMap({
    //   'image': await MultipartFile.fromFile(thumbnailImage),
    // });
    // dio
    //     .post('$imgur_url',
    //         data: formData,
    //         options: Options(headers: {
    //           Headers.wwwAuthenticateHeader: 'Client-ID $clientId',
    //           'Accept': "*/*"
    //         }))
    //     .then((value) {
    //   if (value.data['success']) {
    //     dynamic data = value.data['data'];
    //     print(data['link']);
    //     setState(() {
    //       thumbnail = data['link'];
    //     });
    //   }
    // }).catchError((e) {
    //   print(e.toString());
    // });
  // }

  Future<void> register() async {
    if (_username.text == '' ||
        _phoneNumber.text == '' ||
        _address.text == '' ||
        _password.text == '' ||
        _reenterPassword.text == ''
    ) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Vui lòng điền đầy đủ thông tin"),
              ));
    } else if (thumbnail == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Vui lòng đăng tải ảnh đại diện"),
              ));
    } else if (_password.text != _reenterPassword.text) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Mật khẩu không trùng khớp"),
              ));
    } else {
      EasyLoading.show(status: 'loading...');
      dio.post('$api_url/customer/create', data: {
        "username": _username.text,
        "phone": _phoneNumber.text,
        "address": _address.text,
        "password": _password.text,
        "avatar": thumbnail
      }).then((value) {
        print(value.data);
        if (value.data['success']) {
          Navigator.pushNamed(context, LoginScreen.routeName);
        } else {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(value.data['msg']),
                  ));
        }
        EasyLoading.dismiss();
      }).catchError((e) {
        EasyLoading.dismiss();
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: color_gradient_tertiary),
        child: Center(
          child: SingleChildScrollView(
            reverse: false,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: space_huge * 2, horizontal: space_medium),
              child: Column(children: [
                thumbnail != null
                    //This stack holds the product's thumbnail and the close button~~
                    ? Stack(clipBehavior: Clip.none, children: [
                        //This container contains the image itself~~
                        ImagePreviewer(thumbnail),

                        //This is the close button :v
                        Positioned(
                          top: -space_small - 2,
                          right: -space_small - 2,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  thumbnail = null;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(space_tiny - 1),
                                decoration: BoxDecoration(
                                    color: color_white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1000)),
                                    boxShadow: [box_shadow_black]),
                                child: Icon(Icons.close_rounded,
                                    color: color_primary_darker),
                              )),
                        ),
                      ])
                    : ImageSelector(_getThumbnailAsset),

                SizedBox(height: space_big),

                //Username field here~~~~
                TextFormField(
                    controller: _username,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      labelText: "Username",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide:
                            BorderSide(color: color_primary_darker, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide: BorderSide(
                          color: color_secondary,
                          width: 1.5,
                        ),
                      ),
                    )),

                SizedBox(height: space_medium),

                //Phone number field here~~~~
                TextFormField(
                    controller: _phoneNumber,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Số điện thoại',
                      labelText: 'Số điện thoại',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide:
                            BorderSide(color: color_primary_darker, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide: BorderSide(
                          color: color_secondary,
                          width: 1.5,
                        ),
                      ),
                    )),

                SizedBox(height: space_medium),

                //Address field here~~~~
                TextFormField(
                    controller: _address,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Địa chỉ',
                      labelText: "Địa chỉ",
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide:
                            BorderSide(color: color_primary_darker, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide: BorderSide(
                          color: color_secondary,
                          width: 1.5,
                        ),
                      ),
                    )),

                SizedBox(height: space_medium),

                //Password field here~~~~
                TextFormField(
                    controller: _password,
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Mật khẩu',
                      labelText: "Mật khẩu",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide:
                            BorderSide(color: color_primary_darker, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide: BorderSide(
                          color: color_secondary,
                          width: 1.5,
                        ),
                      ),
                    )),

                SizedBox(height: space_medium),

                //Password field here~~~~
                TextFormField(
                    controller: _reenterPassword,
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Nhập lại mật khẩu',
                      labelText: "Nhập lại mật khẩu",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide:
                            BorderSide(color: color_primary_darker, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(border_radius_big),
                        borderSide: BorderSide(
                          color: color_secondary,
                          width: 1.5,
                        ),
                      ),
                    )),

                SizedBox(height: space_medium),

                //Sign up button here~~~~
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: space_small, horizontal: space_big),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        gradient: color_gradient_dark,
                        borderRadius: BorderRadius.all(
                            Radius.circular(border_radius_big)),
                        boxShadow: [box_shadow_black]),
                    child: TextButton(
                        onPressed: register,
                        child: Text(
                          "Đăng ký",
                          style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: color_white),
                        )),
                  ),
                ]),

                SizedBox(height: space_huge),

                //Sign in link here~~~~
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                      "Bạn đã là thành viên?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                          "Đăng nhập",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1.copyWith(color: color_secondary)
                      ))
                ])
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
