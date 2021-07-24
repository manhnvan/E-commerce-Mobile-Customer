import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/profile/update_profile/ChangeAddress/DropdownBtn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChangeAddress extends StatefulWidget {
  final dynamic user;
  final Function updateUser;

  const ChangeAddress({Key key, this.user, this.updateUser}) : super(key: key);

  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  bool loading = true;
  List<dynamic> listCity = [], listDistrict = [], listWard = [];
  String city, district, ward;
  String address;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  var dio = new Dio();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      city = widget.user["city"].toString();
      district = widget.user["district"].toString();
      ward = widget.user["ward"].toString();
      loading = true;
    });
    EasyLoading.show(status: 'loading...');
    var listFuture = [getListCity()];
    if(district != null) listFuture.add(getListDistrict(city));
    if(ward != null) listFuture.add(getListWard(district));

    Future.wait(listFuture).then((value) => EasyLoading.dismiss());
  }

  Future getListCity() async {
    Dio().get("$ghn_url/shiip/public-api/master-data/province", options: Options(
        headers: {
          "token": token_ghn,
        }
    )).then((val) {
      setState(() {
        listCity = val.data["data"];
        loading = false;
      });
    });
  }

  Future getListDistrict(value) async {
    Dio().post("$ghn_url/shiip/public-api/master-data/district", data: {
      "province_id": int.parse(value)
    }, options: Options(
        headers: {
          "token": token_ghn,
        }
    )).then((value) {
      setState(() {
        listDistrict = value.data["data"];
        loading = false;
      });
    });
  }

  Future getListWard(value) async {
    Dio().post("$ghn_url/shiip/public-api/master-data/ward", data: {
      "district_id": int.parse(value)
    }, options: Options(
        headers: {
          "token": token_ghn,
        }
    )).then((value) {
      setState(() {
        listWard = value.data["data"];
        loading = false;
      });
    });
  }

  void handleChange(type, value) {
    if (type == 1) {
      getListDistrict(value);
      setState(() {
        city = value;
        district = null;
        ward = null;
      });
    }
    else if (type == 2) {
      getListWard(value);
      setState(() {
        district = value;
        ward = null;
      });
    }
    else{
      setState(() {
        ward = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15,
            right: 12,
            left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: color_gradient_primary,
        ),
        height: 260,
        child: Form(
          key: _form,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.mi,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text("Thay đổi địa chỉ",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .merge(TextStyle(fontSize: 22))),
                ),
                Container(height: 40, child: DropdownBtn(listItem: listCity, handleChange: handleChange, initValue: city, type: 1)),
                Container(height: 40, child: DropdownBtn(listItem: listDistrict, handleChange: handleChange, initValue: district, type: 2)),
                Container(height: 40, child: DropdownBtn(listItem: listWard, handleChange: handleChange, initValue: ward, type: 3)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                            gradient: LinearGradient(
                                begin: Alignment(-0.75, 0),
                                end: Alignment(0.5, 0),
                                colors: [
                                  const Color(0x66FFFFFF),
                                  const Color(0x6FB6F492)
                                ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 2))
                            ]),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 0,
                              primary: Colors.transparent,
                              padding: EdgeInsets.all(0),
                              onPrimary: Colors.black,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Huỷ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .merge(TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                            gradient: color_gradient_primary,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 2))
                            ]),
                        child: ElevatedButton(
                          onPressed: () {
                            if(ward == null || district == null || city == null){
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
                                        content: Text('Hãy điền đầy đủ thông tin địa chỉ.', style: TextStyle(color: Colors.white)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                    );
                                  }
                              );
                            }
                            else{
                              var tWard = listWard.where((element) => element["WardCode"] == ward.toString()).toList()[0]["WardName"];
                              var tDistrict = listDistrict.where((element) => element["DistrictID"].toString() == district.toString()).toList()[0]["DistrictName"];
                              var tCity = listCity.where((element) => element["ProvinceID"].toString() == city.toString()).toList()[0]["ProvinceName"];
                              var newUser = widget.user;
                              newUser["city"] = city;
                              newUser["district"] = district;
                              newUser["ward"] = ward;
                              newUser["address"] = tWard + ", " + tDistrict + ", " + tCity;
                              widget.updateUser(newUser);
                              Navigator.of(context).pop();
                            }

                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 0,
                              primary: Colors.transparent,
                              padding: EdgeInsets.all(0),
                              onPrimary: Colors.black,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Lưu',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .merge(TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
