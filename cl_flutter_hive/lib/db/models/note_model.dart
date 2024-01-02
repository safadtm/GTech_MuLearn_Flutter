// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NoteModel {

 @HiveField(0) 
 final String id;
 
 @HiveField(1)
 final String title;
 
 @HiveField(2)
 final String body;
 
 @HiveField(3)
 final String dateTime;
  NoteModel({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
  });

}
