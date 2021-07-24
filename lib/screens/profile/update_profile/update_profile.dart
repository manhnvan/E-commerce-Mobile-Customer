import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/ImagePreviewer.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/LoginScreen/LoginScreen.dart';
import 'package:customer_app/screens/profile/update_profile/ChangeAddress/change_address.dart';
import 'package:customer_app/screens/profile/update_profile/ChangeAvatar/change_avatar.dart';
import 'package:customer_app/screens/profile/update_profile/InlineEditText.dart';
import 'package:customer_app/screens/profile/update_profile/ChangePassword/change_password.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  static String routeName = '/update_profile';
  final dynamic userInfo;
  final Function update;

  const UpdateProfile({Key key, this.userInfo, this.update}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  dynamic user, oldUser;
  var dio = new Dio();

  Future _getThumbnailAsset(type) async {

    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: type ? ImageSource.camera : ImageSource.gallery,);
    if (!mounted) return;
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
        var newUser = {...user, "avatar": data["link"]};
        setState(() {
          user = newUser;
        });
        // widget.update(newUser);
      }
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      user = widget.userInfo;
      oldUser = widget.userInfo;
    });
    super.initState();
  }

  void _updateUser(newUser) {
    setState(() {
      user = newUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Chỉnh sửa thông tin",
            style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white))),
      ),
      body: user != null ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: color_gradient_primary
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 70),
                child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          context: context,
                          builder: (BuildContext context){
                        return ChangeAvatar(getThumbnailAsset: _getThumbnailAsset);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(space_tiny),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        Border.all(width: space_tiny - 2, color: Colors.white.withOpacity(0.5)),
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                              user["avatar"],
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover
                          ),
                        ),
                        radius: 60,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      gradient: color_gradient_glass,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      border: Border.all(color: Colors.white, width: 0.5)
                    ),
                    child: Column(
                      children: [
                        InlineEditText(title: "Họ tên", initValue: user["username"], onSubmit: (value){
                          var newUser = {...user, "username": value};
                          setState(() {
                            user = newUser;
                          });
                        },),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black45
                        ),
                        InlineEditText(title: "Số điện thoại", initValue: user["phone"], onSubmit: (value){
                          var newUser = {...user, "phone": value};
                          setState(() {
                            user = newUser;
                          });
                        },),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black45
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,10,12,10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Địa chỉ", style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
                                SizedBox(width: 30),
                                // Expanded(
                                //   child: Text(user["address"], style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16)), maxLines: 2,
                                //       overflow: TextOverflow.ellipsis, softWrap: false),
                                // ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      user["address"],
                                        style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),
                      ]
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20 ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                          gradient: color_gradient_glass,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              context: context,
                              builder: (BuildContext context){
                                return ChangeAddress(user: user, updateUser: _updateUser);
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(12,10,12,10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                            ),
                            elevation: 0,
                            primary: Colors.transparent,
                            onPrimary: Colors.black,
                            shadowColor: Colors.transparent
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Thay đổi địa chỉ",
                                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
                              Icon(Icons.chevron_right_rounded, size: 30, color: Colors.white)
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20 ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                          gradient: color_gradient_glass,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              context: context,
                              builder: (BuildContext context){
                                return ChangePassword(customerId: user["_id"]);
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(12,10,12,10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                            ),
                            elevation: 0,
                            primary: Colors.transparent,
                            onPrimary: Colors.black,
                            shadowColor: Colors.transparent
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Thay đổi mật khẩu",
                                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
                              Icon(Icons.chevron_right_rounded, size: 30, color: Colors.white)
                            ]),
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                        gradient: color_gradient_glass,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(12,10,12,10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                          ),
                          elevation: 0,
                          primary: Colors.transparent,
                          onPrimary: Colors.black,
                          shadowColor: Colors.transparent
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Đăng xuất",
                                style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
                            Icon(Icons.chevron_right_rounded, size: 30, color: Colors.white)
                          ]),
                    ),
                  )
                ]
            ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
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
                          width: 150,
                          height: 50,
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
                                EasyLoading.show(status: 'loading...');
                                dio.post("$api_url/customer/${user["_id"]}/update/info", data:{
                                  "username": user["username"],
                                  "avatar": user["avatar"],
                                  "phone": user["phone"],
                                  "address": user["address"],
                                  "city": user["city"],
                                  "district": user["district"],
                                  "ward": user["ward"],
                                }).then((value) {
                                  EasyLoading.dismiss();
                                  if(value.data["success"]){
                                    widget.update(value.data["doc"]);
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
                                              content: Text('Cập nhật thông tin thành công', style: TextStyle(color: Colors.white)),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                          );
                                        }
                                    );
                                  }
                                });
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
                              child: Text('Chấp nhận',
                                style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16, color: Colors.white)),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ]),
        )
      ) : Container()
    );
  }
}
