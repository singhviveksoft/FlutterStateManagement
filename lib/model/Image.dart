class Image{
  final String small;

  Image({required this.small});

  factory Image.fromJson(Map<String,dynamic>json){
    return Image(
    small: json['small']);
  }
}