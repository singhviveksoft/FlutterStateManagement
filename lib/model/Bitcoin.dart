import 'package:state_mangement_provider/model/Image.dart';

class Bitcoin {
  final String id;
  final List<String> categories;
  final Image image;

  Bitcoin({required this.id, required this.categories, required this.image});

  factory Bitcoin.fromJson(Map<String, dynamic> data) {
    return Bitcoin(
        id: data['id'],
        categories: List<String>.from(data['categories']),
        image: Image.fromJson(data['image']));
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['categories'] = categories;
    map['image'] = image;

    return map;
  }
}
