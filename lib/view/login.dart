import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/home.dart';
import 'package:flutter_application_3/view/profile.dart';
import 'package:flutter_application_3/view/register.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('تم تسجيل الدخول بنجاح')));
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-in failed: $e')),
        );
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControl = TextEditingController();
    TextEditingController passwordControl = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "تسجيل الدخول",
          style: GoogleFonts.almarai(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 60),
              child: Center(
                child: SvgPicture.network(
                  'https://non14.net/assets/main/images/non14.svg',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailControl,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'البريد الالكتروني',
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelStyle: GoogleFonts.almarai(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    hintText: 'اكتب البريد مثل abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 20),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordControl,
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'الرقم السري',
                    prefixIcon: const Icon(Icons.password),
                    labelStyle: GoogleFonts.almarai(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    hintText: 'ادخل الرقم السري هنا'),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     'هل نسيت الررقم السري ؟',
            //     style: GoogleFonts.almarai(
            //         fontSize: 16, fontWeight: FontWeight.bold),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(
                      email: emailControl.text,
                      password: passwordControl.text,
                      context: context);
        
                  //userinfo details
                  // ignore: avoid_print
                  print(user);
                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        (MaterialPageRoute(
                            builder: (context) =>  ProfileUser(userdata: user.email.toString(),))));
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('لديك خطا في الاميل او الباسوورد',
                              style: GoogleFonts.almarai(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                    );
                  }
                },
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Text(' ليس لديك حساب ؟',
                style: GoogleFonts.almarai(
                    fontSize: 13, fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () => Get.to(const Register()),
                child: Text('انشاء حساب جديد',
                    style: GoogleFonts.almarai(
                        fontSize: 17, fontWeight: FontWeight.bold))),
         const SizedBox(height: 100,),
            TextButton(
                onPressed: () => Get.to(const Homepage()),
                child: Text('تخطي',
                    style: GoogleFonts.almarai(
                        fontSize: 17, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
