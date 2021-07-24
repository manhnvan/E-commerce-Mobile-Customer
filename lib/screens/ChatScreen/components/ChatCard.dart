import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChatCard extends StatelessWidget {
  var chatCardInfo;

  ChatCard(this.chatCardInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: space_medium, vertical: space_small),
      decoration: BoxDecoration(
          borderRadius: card_shape_secondary, boxShadow: [box_shadow_black]),
      child: ClipRRect(
        borderRadius: card_shape_secondary,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(border_radius_big)),
              gradient: color_gradient_secondary),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: card_shape_secondary, color: color_white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Customer's profile image here ^^
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: space_tiny - 2.5,
                            color: color_primary_darker),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                        radius: space_huge + space_medium,
                        backgroundImage: NetworkImage(chatCardInfo['avatar']))),

                //Customer chat info here ^^
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.only(left: space_medium),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Chat's topic here :3
                        Text(
                          chatCardInfo['topic'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.bold, fontSize: 13.5),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: space_tiny),

                        //Chat's date here :3
                        Text(
                          chatCardInfo['lastMessage'] != null
                              ? DateFormat('dd/MM/yyyy hh:mm').format(
                                  DateTime.parse(
                                      chatCardInfo['lastMessage']['created']))
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 13.5, color: color_black_opacity_strong),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: space_medium),

                        //Chat's last message here :3
                        Container(
                          child: Text(chatCardInfo['lastMessage']['content'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontSize: 13.5),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
