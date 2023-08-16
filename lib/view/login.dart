import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'البريد الالكتروني',
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
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'الرقم السري',
                    labelStyle: GoogleFonts.almarai(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    hintText: 'ادخل الرقم السري هنا'),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'هل نسيت الررقم السري ؟',
                style: GoogleFonts.almarai(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
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
            const Text(' ليس لديك حساب ؟'),
            const Text('انشاء حساب')
          ],
        ),
      ),
    );
  }
}
