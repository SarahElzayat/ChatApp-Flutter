import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

class MessageBubble extends StatelessWidget {
  // const MessageBubble({Key? key}) : super(key: key);
  const MessageBubble(this.message, this.isMe, this.username, this.userImage,
      {required this.key});
  final String message;
  final bool isMe;
  final String username;
  final String userImage;

  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe)
          Padding(
            padding: EdgeInsets.only(left: 2, bottom: 5),
            child: CircleAvatar(
              // radius: 17,
              backgroundImage: NetworkImage(userImage),
            ),
          ),
        // SizedBox(width: 0,),
        Container(
          
          decoration: BoxDecoration(
            
            color: 
                 Color.fromARGB(225, 35, 63, 139),
                 //.withOpacity(.7),
                // : Color(0xffFFBCBC).withOpacity(.5),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft:
                  !isMe ? const Radius.circular(0) : const Radius.circular(15),
              bottomRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(15),
            ),
          ),
          width: 180,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(username,
            style: Theme.of(context).textTheme.bodyText1),
            Text(message, 
            style: Theme.of(context).textTheme.headline1),
          ]),
        ),
        if (isMe)
          Padding(
            padding: EdgeInsets.only(right: 2, bottom: 5),
            child: CircleAvatar(
              // radius: 15,
              backgroundImage: NetworkImage(userImage),
            ),
          ),
      ],
    );
  }
}
