import 'package:flutter/material.dart';

class ProfileFollowing extends StatefulWidget {
  const ProfileFollowing({
    Key key,
    this.currentUserId
  }) : super(key: key);

  final String currentUserId;

  @override
  _ProfileFollowingState createState() => _ProfileFollowingState();
}

class _ProfileFollowingState extends State<ProfileFollowing> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('dcm')
    );
  }
}
