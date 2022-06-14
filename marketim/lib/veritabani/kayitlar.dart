class kayitlar {
  String text;

  kayitlar(this.text);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map["text"] = text;
    return map;
  }

  factory kayitlar.fromMap(Map<String, dynamic> map) {
    return kayitlar(map["text"]);
  }
}
