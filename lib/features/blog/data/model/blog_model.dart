import 'package:rivaan_project2/features/blog/domain/entity/blog_entity.dart';
import 'package:equatable/equatable.dart';

class BlogModel extends Equatable {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final String imageUrl;
  final List<String> topics;
  final DateTime updatedAt;
  final String? posterName;

  const BlogModel(
      {required this.id, required this.posterId, required this.title, required this.content, required this.imageUrl, required this.topics, required this.updatedAt, this.posterName});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] as String,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['image_url'] ?? '',
      topics: List<String>.from(json['topics']??[]),
      updatedAt: json['updated_at'] ==null?
      DateTime.now():
      DateTime.parse(json['updated_at']) ,
      posterId: json['poster_id'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'image_url': imageUrl,
      'topics': topics,
      'updated_at': updatedAt.toIso8601String(),
      'poster_id': posterId,
    };
  }
  factory BlogModel.fromHiveJson(Map<dynamic, dynamic> json) {
    return BlogModel(
      id: json['id'] as String,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['image_url'] ?? '',
      topics: List<String>.from(json['topics'] ?? []),
      updatedAt: json['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(json['updated_at']),
      posterId: json['poster_id'] ?? '',
      posterName: json['posterName'],
    );
  }

  @override
  List<Object?> get props =>
      [id, title, content, imageUrl, topics, updatedAt,posterId];

BlogModel copyWith({
  String? id,
  String? posterId,
  String? title,
  String? content,
  String? imageUrl,
  List<String>? topics,
  DateTime? updatedAt,
  String? posterName
}){
  return BlogModel(
      id: id??this.id,
      posterId: posterId??this.posterId,
      title: title??this.title,
      content: content??this.content,
      imageUrl: imageUrl??this.imageUrl,
      topics: topics??this.topics,
      updatedAt: updatedAt??this.updatedAt,
      posterName: posterName??this.posterName
  );
}
  BlogEntity toEntity() {
    return BlogEntity(
      id: id,
      posterId: posterId,
      title: title,
      content: content,
      imageUrl: imageUrl,
      topics: topics,
      updatedAt: updatedAt,
      posterName: posterName??'',
    );
  }


}