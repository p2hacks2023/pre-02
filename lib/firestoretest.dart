import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStore extends StatefulWidget {
  const FireStore({super.key});

  @override
  State<FireStore> createState() => _FireStoreState();
}

class _FireStoreState extends State<FireStore> {
  Future<QuerySnapshot<Object?>>? get;
  @override
  Widget build(BuildContext context) {
    CollectionReference tests = FirebaseFirestore.instance.collection('tests');
    
    Future<void> addTest() {
      return tests
        .add({
          'name': "aiueo",
          'id' : 1022063,
        })
        .then((value) => print("testadded"))
        .catchError((error) => print("エラーが起きた${error.toString()}"));
    }
    
    return Column(
      children: [
        TextButton(
          onPressed: () => addTest(),
          child: Text("add test"),
        ),
        TextButton(
          onPressed: ()=> tests.get(),
          child: Text("みる"),
        ),
        /*
        if(get != null) FutureBuilder(
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            }
          }
        ),*/
      ],
    );
  }
}