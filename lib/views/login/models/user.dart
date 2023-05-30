import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserModel {
  final String email;
  final DateTime dateTime;
  final int gameScore;
  final String name;
  final int spendTime;

  UserModel({
    required this.email,
    required this.dateTime,
    required this.gameScore,
    required this.name,
    required this.spendTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      // dateTime: DateFormat('dd.MM.yyy').format(map['dateTime'].toDate()),
      dateTime: DateTime.fromMillisecondsSinceEpoch(
          map['dateTime'].millisecondsSinceEpoch),
      gameScore: map['gameScore'] as int,
      name: map['name'] as String,
      spendTime: map['spendTime'] as int,
    );
  }

  String toJson() => json.encode(<String, dynamic>{
        'email': email,
        'dateTime': Timestamp.fromDate(dateTime),
        'gameScore': gameScore,
        'name': name,
        'spendTime': spendTime,
      });
}
