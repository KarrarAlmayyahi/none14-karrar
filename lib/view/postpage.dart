import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/posts.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Postpage extends StatelessWidget {
  final Data getpost;

  const Postpage({super.key, required this.getpost});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.network(
            'https://non14.net/assets/main/images/non14.svg',
            width: 46,
            height: 46,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Title
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 25, 10, 20),
                child: Text(
                  getpost.subject.toString(),
                  style: GoogleFonts.almarai(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              //Image
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image.network(
                    getpost.coverOriginalObj.toString(),
                    height: MediaQuery.sizeOf(context).height / 2.8,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                  // Category name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 10, 10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          getpost.postCategory!.name.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text(getpost.createdAt.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              //Description
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Html(data: getpost.content!, style: {
                  // tables will have the below background color
                  "span": Style(
                    fontSize: FontSize.larger,
                  ),
                }),
              )
            ],
          ),
        ));
  }
}
