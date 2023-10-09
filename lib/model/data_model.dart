class DataModel {
  final String key;
  final List<String> images;
  final String name;
  final String description;
  final int likeCount;
  final String location;
  final int age;
  final List<String> tags;

  DataModel.fromJson(Map<String, dynamic> json, this.key)
      : images = json['images'].cast<String>(),
        name = json['name'],
        description = json['description'],
        likeCount = json['likeCount'],
        location = json['location'],
        age = json['age'],
        tags = json['tags'].cast<String>();
}



  
// {
//   "images": [
//     "https://domf5oio6qrcr.cloudfront.net/medialibrary/6372/202ebeef-6657-44ec-8fff-28352e1f5999.jpg"
//   ],
//   "name": "banana",
//   "description": "Hi this is fruit. I like you",
//   "likeCount": 40,
//   "location": "busan",
//   "age": 27,
//   "tags": ["nonSmocking", "INTP", "goodSmile", "goodFace"]
// }
