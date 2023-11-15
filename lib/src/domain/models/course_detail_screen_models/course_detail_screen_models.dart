import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class CourseModel extends Equatable {
  final int id;
  final String? titleCourse;
  final String? teach;
  final int? prices;
  final DateTime? endDate;
  final String? find;

  const CourseModel(this.id, this.titleCourse, this.teach, this.prices, this.endDate, this.find);
  
  @override
  List<Object?> get props => [id, titleCourse, teach, prices, endDate, find];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titleCourse': titleCourse,
      'teach': teach,
      'prices': prices,
      'endDate': endDate?.millisecondsSinceEpoch,
      'find': find,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      map['id'] as int,
      map['titleCourse'] != null ? map['titleCourse'] as String : null,
      map['teach'] != null ? map['teach'] as String : null,
      map['prices'] != null ? map['prices'] as int : null,
      map['endDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int) : null,
      map['find'] != null ? map['find'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
