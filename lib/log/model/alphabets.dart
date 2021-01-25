class Alphabet {
  String id;
  String url;
  String title;

  Alphabet ({this.id, this.url, this.title});

  Alphabet.fromMap (Map<String, dynamic> data) {
    id = data['id'];
    url = data['url'];
    title = data['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'url' : url,
      'title' : title
    };
  }
}