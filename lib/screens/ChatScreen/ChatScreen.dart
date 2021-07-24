import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';
import 'Chatbox.dart';
import 'components/ChatCard.dart';

class ChatScreen extends StatefulWidget {
  static final routeName = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<dynamic> chatboxes = <dynamic>[];
  var dio = Dio();

  SharedPreferences prefs;
  String currentUserId;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      currentUserId = prefs.getString('customerId');
      print(currentUserId);
      EasyLoading.show(status: 'loading...');
      dio.get('$chat_url/$currentUserId/').then((value) {
        print(value.data);
        if (value.data['success']) {
          setState(() {
            chatboxes.addAll(value.data['chatboxes']);
          });
        }
        EasyLoading.dismiss();
      }).catchError((error) {
        EasyLoading.dismiss();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: Text("Liên hệ với người bán",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: color_white)),
          gradient: color_gradient_primary,
          automaticallyImplyLeading: false),
      body: Container(
        color: color_grey,
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.only(top: space_medium, bottom: nav_height),
                itemCount: chatboxes.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatBox(
                                  topic: chatboxes[index]['topic'],
                                  chatboxId: chatboxes[index]['_id'])));
                    },
                    child: ChatCard(chatboxes[index]),
                  );
                }),
          ]
        ),
      ),
      bottomNavigationBar: BottomNavbar(2),
      // bottomNavigationBar: BottomNavBar(3),
    );
  }
}

