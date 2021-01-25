class Number {
  String id;
  String url;
  String title;

  Number ({this.id, this.url, this.title});

  Number.fromData (Map<String, dynamic> data) :
        id = data['id'],
        url = data['url'],
        title = data['title'];

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'url' : url,
      'title' : title
    };
  }
}