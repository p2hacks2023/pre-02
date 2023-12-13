import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/model/prePost.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/add_post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends ConsumerWidget{
  String description = "";
  final ImagePicker _picker = ImagePicker();

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("add post")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (value) => description = value,
              decoration: const InputDecoration(
                label: Text("テキスト"),
              ),
            ),
            if(!ref.watch(addPostViewModelProvider).uploading)
              TextButton(
                onPressed: () async{
                  ref.read(addPostViewModelProvider.notifier).changeIsUploading(true); //アップロード中に状態を変更
                  await ref.read(addPostViewModelProvider.notifier).addPost(
                    PrePost(
                      description: description,
                      poster: ref.watch(userViewModelProvider).email,
                    ),
                    ref
                  );
                  router.pop();
                }, 
                child: const Text("投稿する")
              ),
            OutlinedButton(
              onPressed: () async {
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  ref.read(addPostViewModelProvider.notifier).addFile(File(image.path));//_file = File(_image!.path);
                } else {
                  debugPrint("写真選択キャンセル");
                }
              },
              child: const Text('画像を選択')
            ),
            OutlinedButton(
              onPressed: () async {
                await ref.read(addPostViewModelProvider.notifier).Camera();
                router.push('/post/add/camera');
              },
              child: const Text('写真を撮影')
            ),
            
            if(ref.watch(addPostViewModelProvider).file != null) Image.file(ref.watch(addPostViewModelProvider).file!)
            
          ],
        ),
      ),
    );
  }
}


class TakePictureScreen extends ConsumerWidget{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;


  @override
  void dispose(){
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context, ref){

     _controller = CameraController(
      ref.watch(addPostViewModelProvider).camera!,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initializeControllerFuture,
       builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return  CameraPreview(_controller);
        }else{
          return const Center(child: CircularProgressIndicator()
          );
        }
       },
       ),
       floatingActionButton: FloatingActionButton(
        onPressed:()async{
          final image = await _controller.takePicture();
          ref.read(addPostViewModelProvider.notifier).addFile(File(image.path));
          router.pop();
        },
        child: const Icon(Icons.camera_alt),
         ),
       
    );
    
  }
}




