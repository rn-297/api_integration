class MyApiData {
  List<MyPostsData>? myPostsData;

  MyApiData({this.myPostsData});

  MyApiData.fromJson(Map<String, dynamic> json) {
    if (json['MyPostsData'] != null) {
      myPostsData = <MyPostsData>[];
      json['MyPostsData'].forEach((v) {
        myPostsData!.add(new MyPostsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myPostsData != null) {
      data['MyPostsData'] = this.myPostsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyPostsData {
  int? userId;
  int? id;
  String? title;
  String? body;

  MyPostsData({this.userId, this.id, this.title, this.body});

  MyPostsData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
