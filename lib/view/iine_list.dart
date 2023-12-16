import 'package:firebase_tutorial/view_model/single/iine_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IineList extends ConsumerWidget {
  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text('いいね'),backgroundColor: Colors.transparent),
      body: //Text('Bottom Sheet'),
          ref.watch(iineListViewModelProvider).maybeWhen(
        data: (data) {
          if (data.userList == null) {
            return Text("daiue");
            //nullの時
          } else {
            return ListView.builder(
              itemCount: data.userList!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [                    
                      Row(
                        children: [
                          SizedBox(width:20,height: 5),
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  data.userList![index].iconUrl.toString())),
                          SizedBox(width:20,height:20),
                          Text(
                            data.userList![index].nickname,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 80),
                          alignment: Alignment.bottomLeft,
                          child: Text(data.userList![index].introduction, )
                          ),
                    ],
                  ),
                );
              },
            );
          }
        },
        orElse: () {
          Text("orelse");
        },
      ),
    );
  }
}
