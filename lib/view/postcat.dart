import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/postpage.dart';
import 'package:get/get.dart';
import '../model/posts.dart';
import '../services/fetch_data.dart';

class Postcat extends StatefulWidget {
  final PostCategory category;
  const Postcat({super.key, required this.category});

  @override
  State<Postcat> createState() => _PostcatState();
}

class _PostcatState extends State<Postcat> {
  List<Data> postcat = [];
  var isload = false;
  @override
  void initState() {
    super.initState();
    getpostcat();
  }

  getpostcat() async {
    await Fetchdata().getpostcat(categories: widget.category.id).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        setState(() {
          postcat = value;
          isload = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category.name.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          
        ),
        body: Visibility(
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            visible: isload,
            child: ListView.builder(
                itemCount: postcat.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            // Comment Not Working Down
                            Get.to(Postpage(getpost: postcat[index]));
                          }),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  postcat[index].subject.toString(),
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              // Category name
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 15, 10, 15),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      postcat[index]
                                          .postCategory!
                                          .name
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 15, 10),
                                    child: Text(
                                        postcat[index].createdAt.toString()),
                                  ),
                                ],
                              ),
                              // time
                              // image
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                postcat[index].coverOriginalObj.toString(),
                                height: MediaQuery.sizeOf(context).height / 2.8,
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ));
                })));
  }
}
