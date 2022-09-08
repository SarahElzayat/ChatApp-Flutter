import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:max_firebase/widgets/chats/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: Future.value(FirebaseAuth.instance.currentUser),
      builder: (context, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // print('FUTURE USER IDDDDD ' + futureSnapshot.data!.uid);
            // print('SNAPSHOT USER IDDDDD ' +  snapshot.data!.docs[0]['userId']);

            return ListView.builder(
              reverse: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                    snapshot.data!.docs[index]['text'],
                    snapshot.data!.docs[index]['userId'] ==
                        futureSnapshot.data!.uid,
                        snapshot.data!.docs[index]['username'],
                        snapshot.data!.docs[index]['userImage'],
                        
                        key: ValueKey(snapshot.data!.docs[index].id),);
              },
            );
          },
        );
      },
    );
  }
}
