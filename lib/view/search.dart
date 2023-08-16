import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/posts.dart';
import 'package:flutter_application_3/view/postpage.dart';
import 'package:get/get.dart';

import '../services/fetch_data.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  // final Data categorytitle;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var loading = false;
  String search = '';
  List<Data> searchR = [];

  @override
  void initState() {
    super.initState();
    getsearch();
  }

  getsearch() async {
    setState(() {
      loading = false;
    });
    await Fetchdata().getpostcat(search: search, limit: 20).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        setState(() {
          searchR = value;
          loading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البحث')),
      body: Column(
        children: [
          TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'اكتب عنوان الخبر',
              ),
              onChanged: (value) {
                search = value;
                getsearch();
              }),

          Expanded(
            child: Center(
              child: Visibility(
                replacement: const SizedBox(
                  child: CircularProgressIndicator(),
                ),
                visible: loading,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                      itemCount: searchR.length,
                      itemBuilder: (context, index) {
                        Data item = searchR[index];
                        return ListTile(
                          onTap: () => Get.to(() => Postpage(getpost: item)),
                          title: Text(item.subject.toString()),
                        );
                      }),
                ),
              ),
            ),
          )
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Text(searchR.toString()),
          // ),
        ],
      ),
    );
  }
}
