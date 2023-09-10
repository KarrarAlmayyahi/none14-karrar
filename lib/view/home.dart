import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/model/posts.dart';
import 'package:flutter_application_3/services/fetch_data.dart';
import 'package:flutter_application_3/view/login.dart';
import 'package:flutter_application_3/view/postcat.dart';
import 'package:flutter_application_3/view/postpage.dart';
import 'package:flutter_application_3/view/search.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List<Post>? post;
  List<Data> datum = [];
  List<PostCategory> cat = [];
//search parameter
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  var isload = false;
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    // getdata();
    getdatum();
    getcat();
  }

  // getcat() {
  //   getdatum();
  //   for (var item2 in datum['data'].postCategory!.name.toString()) {
  //     datum.add(Data.fromJson(item2));
  //   }
  // }

  // getdata() async {
  //   post = await Fetchdata().getdata();
  //   if (post != null) {
  //     setState(() {
  //       isload = true;
  //     });
  //   }
  // }

  getdatum() async {
    datum = await Fetchdata().getdatum();
    // ignore: unnecessary_null_comparison
    if (datum != null) {
      setState(() {
        isload = true;
      });
    }
  }

  getcat() async {
    cat = await Fetchdata().getcat();
    // ignore: unnecessary_null_comparison
    if (cat != null) {
      setState(() {
        isload = true;
      });
    }
  }
  void _signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تسجيل الخروج بنجاح'))
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('يوجد خطا في تسجيل الخروج: $e')),
    );
  }
}




  static const String _imageUrl =
      'https://non14.net/images/large/8-1692194437.jpg';
  // 'https://pic.imamhussain.org/photos/hd/1323-6741690969478.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Search Button
      //code dow is work
      floatingActionButton: FloatingActionButton(
        tooltip: 'ابحث هنا',
        onPressed: () {
          Get.to(() => const Search());
          // showSearch(
          //   context: context,
          //   delegate: SearchPage<Data>(
          //     items: datum,
          //     searchLabel: 'ابحث هنا',
          //     suggestion: const Center(
          //       child: Text(
          //         'اكتب عنوان المقال في البحث اعلاه',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     failure: const Center(
          //       child: Text(
          //         'ناسف لاتوجد نتائج :(',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     filter: (Data pos) => [
          //       pos.subject.toString(),

          //       // pos.content.toString(),
          //     ],
          //     builder: (Data pos) => ListTile(
          //       title: Text(pos.subject.toString()),
          //       onTap: () => Get.to(() => Postpage(getpost: pos)),
          //       // subtitle: Text(pos.subject.toString()),
          //       // trailing: Text('${pos.subject} yo'),
          //     ),
          //   ),
          // );
        },
        child: const Icon(Icons.search),
      ),

      appBar: AppBar(
        title: SvgPicture.network(
          'https://non14.net/assets/main/images/non14.svg',
          width: 46,
          height: 46,
        ),
        actions: [
          // Text('تسجيل الدخول',
          //     style: GoogleFonts.almarai(
          //         fontSize: 14, fontWeight: FontWeight.bold)),
          IconButton(
              onPressed: () {
                Get.to(() => const Login());
              },
              icon: const Icon(Icons.person)),
              IconButton(onPressed: (){_signOut(context);}, icon: const Icon(Icons.close))

        ],
      ),
      body: Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        visible: isload,
        child: ListView.builder(
            itemCount: datum.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      // Comment Not Working Down
                      Get.to(Postpage(getpost: datum[index]));
                    }),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            datum[index].subject.toString(),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // Category name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 15, 10, 15),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                datum[index].postCategory!.name.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                              child: Text(datum[index].createdAt.toString()),
                            ),
                          ],
                        ),
                        // time
                        // image
                        const SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          datum[index].coverOriginalObj.toString(),
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
                ),
              );
            }),
      ),
      //Drawer
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 8.0,
                  right: 4.0,
                  child: Text(
                    "وكالة نون الخبرية",
                    style:
                        GoogleFonts.almarai(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          //display post by category
          for (var i = 0; i < cat.length; i++)
            ListTile(
              leading: CircleAvatar(
                child: Image.network(
                  cat[i].icon.toString(),
                  width: 22,
                  height: 22,
                  color: Colors.white,
                ),
              ),
              title: Text(cat[i].name.toString(),
                  style: GoogleFonts.almarai(fontSize: 16)),
              onTap: () {
                Get.to(() => Postcat(
                      category: cat[i],
                    ));
              },
            ),
        ]),
      ),
    );
  }
}
