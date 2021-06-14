import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeAvatar extends StatefulWidget {
  final Function getThumbnailAsset;
  const ChangeAvatar({Key key, this.getThumbnailAsset}) : super(key: key);

  @override
  _ChangeAvatarState createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {
  var dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: color_gradient_primary
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              widget.getThumbnailAsset(true);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.transparent,
                padding: EdgeInsets.fromLTRB(12,5,12,5),
                onPrimary: Colors.black,
                shadowColor: Colors.transparent
            ),
            child: Row(
              children: [
                Icon(Icons.camera_alt_rounded, color: Colors.black),
                SizedBox(width: 12),
                Text("Take a photo", style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16)))
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.getThumbnailAsset(false);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.transparent,
                padding: EdgeInsets.fromLTRB(12,5,12,5),
                onPrimary: Colors.black,
                shadowColor: Colors.transparent
            ),
            child: Row(
              children: [
                Icon(Icons.photo_library_rounded, color: Colors.black),
                SizedBox(width: 12),
                Text("Choose from gallery", style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16)))
              ],
            ),
          )
        ],
      )
    );
  }
}
