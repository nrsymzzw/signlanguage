class Quiz {
  String id;
  String imgUrl;
  String title;
  String desc;

  Quiz ({this.id, this.imgUrl, this.title, this.desc});

  Quiz.fromMap (Map<String, dynamic> data) {
    id = data['id'];
    imgUrl = data['imgUrl'];
    title = data['title'];
    desc = data['desc'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'imgUrl' : imgUrl,
      'title' : title,
      'desc' : desc
    };
  }
}