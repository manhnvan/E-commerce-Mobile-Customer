import 'package:flutter/material.dart';

class DropdownBtn extends StatefulWidget {
  final List<dynamic> listItem;
  final int type;
  final Function handleChange;
  final String initValue;
  const DropdownBtn({Key key, this.listItem, this.type, this.handleChange, this.initValue}) : super(key: key);

  @override
  _DropdownBtnState createState() => _DropdownBtnState();
}

class _DropdownBtnState extends State<DropdownBtn> {
  String textHint = "";
  @override
  void initState() {
    // TODO: implement initState
    textHint = widget.type == 1 ? "City" : widget.type == 2 ? "District" : "Ward";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(textHint),
      isExpanded: true,
      value: widget.initValue == null ? null : widget.initValue.toString(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 20,
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
      underline: Container(
        height: 0,
        color: Colors.black,
      ),
      onChanged: (newValue) {
        widget.handleChange(widget.type, newValue.toString());
      },
      items: widget.listItem.map<DropdownMenuItem<String>>((c) {
        if(widget.type == 1){
          return DropdownMenuItem<String>(
            value: c["ProvinceID"].toString(),
            child: Text(c["ProvinceName"]),
          );
        }
        else if(widget.type == 2) {
          return DropdownMenuItem<String>(
            value: c["DistrictID"].toString(),
            child: Text(c["DistrictName"]),
          );
        }
        else{
          return DropdownMenuItem<String>(
            value: c["WardCode"].toString(),
            child: Text(c["WardName"]),
          );
        }
      }).toList(),
    ) ;
  }
}
