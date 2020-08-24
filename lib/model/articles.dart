class Articles {
  String title;
  String article;
  String date;

  Articles({
    this.title,
    this.article,
    this.date
  });

  factory Articles.fromJson(Map<String, String> json){
    return Articles(
      title: json['title'],
      article: json['article'],
      date: json['date']
    );
  }
}