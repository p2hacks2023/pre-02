import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_tutorial/model/prePost.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/add_post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class AddPost extends ConsumerWidget {
  String description = "";
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF190831),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              if (ref.watch(addPostViewModelProvider).file != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.file(
                            fit: BoxFit.cover,
                            ref.watch(addPostViewModelProvider).file!),
                      )),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(120),
                    color: Colors.white,
                    dashPattern: const [
                      15.0, // 点線を引く長さ
                      6.0 //点線の溝の長さ
                    ],
                      child: Container(
                        child: const AspectRatio(
                         aspectRatio: 3 / 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF190831).withOpacity(0),
                          borderRadius: BorderRadius.circular(120),
                        ),
                      ),
                  ),
                ),
              Row(
                children: [
                  const SizedBox(width: 30),
                  Flexible(
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xFF190831),
                      ),
                      onChanged: (value) => description = value,
                      decoration: const InputDecoration(
                        hintText: "add text",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                 const SizedBox(width: 30),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    //写真を選択
                    iconSize: 45,
                    onPressed: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        ref.read(addPostViewModelProvider.notifier).addFile(
                            File(image.path)); //_file = File(_image!.path);
                      } else {
                        debugPrint("写真選択キャンセル");
                      }
                    },
                    icon: const Icon(Icons.add_photo_alternate),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    //写真を撮影
                    iconSize: 45,
                    onPressed: () async {
                      await ref
                          .read(addPostViewModelProvider.notifier)
                          .Camera();
                      router.push('/post/add/camera');
                    },
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (!ref.watch(addPostViewModelProvider).uploading)
                IconButton(
                  iconSize: 45,
                  onPressed: () async {
                    ref
                        .read(addPostViewModelProvider.notifier)
                        .changeIsUploading(true); //アップロード中に状態を変更
                    await ref.read(addPostViewModelProvider.notifier).addPost(
                        PrePost(
                          description: description,
                          poster: ref.watch(userViewModelProvider).email,
                        ),
                        ref);
                    //router.pop();
                  },
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                )
              else const Text(
                "アップロードが完了しました",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomizeFloatingLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX;
  double offsetY;
  CustomizeFloatingLocation(this.location, this.offsetX, this.offsetY);
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

class TakePictureScreen extends ConsumerWidget {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context, ref) {
    _controller = CameraController(
      ref.watch(addPostViewModelProvider).camera!,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
    return Scaffold(
      backgroundColor: const Color(0xFF190831),
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: CustomizeFloatingLocation(
          FloatingActionButtonLocation.centerDocked, 0, -50),
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          onPressed: () async {
            final image = await _controller.takePicture();
            ref
                .read(addPostViewModelProvider.notifier)
                .addFile(File(image.path));
            router.replace('/yoru');
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
