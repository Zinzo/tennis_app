class Crawling {
  final Map<String,dynamic> data;
  
  Crawling({this.data});

  factory Crawling.fromJson(Map<String,dynamic> json) {
    return new Crawling(
      data: json
    );
  }

  Map<String, dynamic> toJson(json){
      return {'data': json.data};
  }
}
