import 'package:cloud_firestore/cloud_firestore.dart';

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
      dateTime: DateTime.fromMillisecondsSinceEpoch(
          map['dateTime'].millisecondsSinceEpoch),
      gameScore: map['gameScore'] as int,
      name: map['name'] as String,
      spendTime: map['spendTime'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'dateTime': Timestamp.fromDate(dateTime),
        'gameScore': gameScore,
        'name': name,
        'spendTime': spendTime,
      };

  UserModel copyWith({
    String? email,
    DateTime? dateTime,
    int? gameScore,
    String? name,
    int? spendTime,
  }) {
    return UserModel(
      email: email ?? this.email,
      dateTime: dateTime ?? this.dateTime,
      gameScore: gameScore ?? this.gameScore,
      name: name ?? this.name,
      spendTime: spendTime ?? this.spendTime,
    );
  }
}
