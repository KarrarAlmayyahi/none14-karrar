
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class ProfileUser extends StatefulWidget {
  final String userEmail;
  final String userName;
  const ProfileUser(
      {super.key, required this.userEmail, required this.userName});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  bool login = false;

  Uint8List? _imageData;

  final ImagePicker _picker = ImagePicker();


//signout
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('تم تسجيل الخروج بنجاح')));
  }






  

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        // visible: login,
        child: Column(
          children: <Widget>[
            // const Text('اهلا وسهلا بكم'),

// Text('Selected Image'),
//           _image != null
//               ? Image.asset(
//                   _image!.path,
//                   height: 150,
//                 )
//               : Container(height: 150),
//           _image == null
//               ? TextButton(
//                   child: Text('Choose File'),
//                   onPressed: getImage,
//                 )
//               : Container(),
//           _image != null
//               ? TextButton(
//                   child: Text('Upload File'),
//                   onPressed: uploadFile,
//                 )
//               : Container(),
//           _uploadedFileURL != null
//               ? Image.network(
//                   _uploadedFileURL!,
//                   height: 150,
//                 )
//               : Container(),

            _imageData == null
                ? const Text('No image selected.')
                : CircleAvatar(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: MemoryImage(_imageData!),
                    ),
                  ),
            ElevatedButton(
              child: const Text('Upload Image'),
              onPressed: 
              () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  _imageData = await pickedFile.readAsBytes();
                  print(MemoryImage(_imageData!));
                  setState(() {});
                } else {
                  print('No image selected.');
                }
              },
            ),

            //  Text(widget.userEmail),
            //  Text(widget.userName),

            // TextButton(
            //   onPressed:() => Get.to(const Homepage()),
            //    child: const Text('الصفحة الرئيسية')
            //    ),
            //    TextButton(
            //     onPressed:()
            //     {
            //       _signOut();
            //       Get.to(()=>const Login());

            //       setState(() {
            //         login=true;
            //       }
            //       );
            //     // Get.to(const Homepage());
            //     } ,

            //     child:const Text('تسجيل الخروج'))
          ],
        ),
      )),
    );
  }
}
