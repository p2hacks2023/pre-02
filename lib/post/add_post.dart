import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPost extends ConsumerWidget{
  String poster = "tiharu717@gmail.com";
  String description = "";
  Uri image_url = Uri.dataFromString("https://takutk.com/obs/img/math/DSC_0685.JPG");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) => description = value,
        ),
        TextButton(onPressed: (){}, child: Text(""))
      ],
    );
  }

}