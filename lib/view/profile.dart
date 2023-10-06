
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/home.dart';
import 'package:flutter_application_3/view/login.dart';
import 'package:get/route_manager.dart';


class ProfileUser extends StatefulWidget {
  final String userdata ;
    const ProfileUser({super.key,required this.userdata});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  
bool login=false;


 


//signout
  Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
  // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تسجيل الخروج بنجاح'))
    );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Visibility(
           replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        // visible: login,
          child: Column(
            children: [
             
              const Text('اهلا وسهلا بكم'),
              
               Text(widget.userdata),
             
             
              TextButton(
                onPressed:() => Get.to(const Homepage()),
                 child: const Text('الصفحة الرئيسية')
                 ),
                 TextButton(
                  onPressed:()
                  { 
                    _signOut();
                    Get.to(()=>const Login());
                    
                    setState(() {
                      login=true;  
                    }
                    );
                  // Get.to(const Homepage());
                  } ,
                   
                  child:const Text('تسجيل الخروج'))
            ],
          ),
        )
      ),
    );
  }
}
