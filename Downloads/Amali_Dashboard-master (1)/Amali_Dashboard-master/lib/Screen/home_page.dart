import 'package:amali_dashboard/Model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  void handleAprove(bool status , String id) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(id)
        .update({"isApprove": status});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DashBoard")),
      body: StreamBuilder<List<Users>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                  trailing: FittedBox(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: ()  {
                              handleAprove(true,users[index].id);
                            },
                            icon: const Icon(
                              CupertinoIcons.check_mark,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () {
                              handleAprove(false,users[index].id);

                            },
                            icon: const Icon(
                              Icons.block_flipped,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Stream<List<Users>> readUsers() => FirebaseFirestore.instance
      .collection('User')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Users.fromJson(doc.data())).toList());
}
