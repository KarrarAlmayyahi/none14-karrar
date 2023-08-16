
class Post {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Post({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  Post.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    lastPage = json["last_page"];
    lastPageUrl = json["last_page_url"];
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["current_page"] = currentPage;
    // ignore: unnecessary_null_comparison
    // if(data != null) {
    //   data["data"] = data.map((e) => e.toJson()).toList();
    // }
    data["first_page_url"] = firstPageUrl;
    data["from"] = from;
    data["last_page"] = lastPage;
    data["last_page_url"] = lastPageUrl;
    data["next_page_url"] = nextPageUrl;
    data["path"] = path;
    data["per_page"] = perPage;
    data["prev_page_url"] = prevPageUrl;
    data["to"] = to;
    data["total"] = total;
    return data;
  }
}

class Data {
  int? id;
  String? subject;
  String? createdAt;
  String? cover;
  String? content;
  int? category;
  int? views;
  String? dateString;
  String? coverObject;
  String? coverOriginalObj;
  String? contentString;
  PostCategory? postCategory;

  Data({this.id, this.subject, this.createdAt, this.cover, this.content, this.category, this.views, this.dateString, this.coverObject, this.coverOriginalObj, this.contentString, this.postCategory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    subject = json["subject"];
    createdAt = json["created_at"];
    cover = json["cover"];
    content = json["content"];
    category = json["category"];
    views = json["views"];
    dateString = json["date_string"];
    coverObject = json["cover_object"];
    coverOriginalObj = json["cover_original_obj"];
    contentString = json["content_string"];
    postCategory = json["post_category"] == null ? null : PostCategory.fromJson(json["post_category"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["subject"] = subject;
    data["created_at"] = createdAt;
    data["cover"] = cover;
    data["content"] = content;
    data["category"] = category;
    data["views"] = views;
    data["date_string"] = dateString;
    data["cover_object"] = coverObject;
    data["cover_original_obj"] = coverOriginalObj;
    data["content_string"] = contentString;
    if(postCategory != null) {
      data["post_category"] = postCategory?.toJson();
    }
    return data;
  }
}

class PostCategory {
  int? id;
  String? name;
  dynamic description;
  String? link;
  String? color;
  String? icon;

  PostCategory({this.id, this.name, this.description, this.link, this.color, this.icon});

  PostCategory.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    link = json["link"];
    color = json["color"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["link"] = link;
    data["color"] = color;
    data["icon"] = icon;
    return data;
  }
}