import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

part 'car_model.g.dart';

@HiveType(typeId: 0)
class Car {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? imgPath;

  @HiveField(3)
  String? power;

  @HiveField(4)
  String? range;

  @HiveField(5)
  String? seats;

  @HiveField(6)
  String? brand;

  @HiveField(7)
  String? rating;

  @HiveField(8)
  String? type;

  @HiveField(9)
  String? ownerEmail;

  @HiveField(10)
  String? id;


  Car({
    @required this.name,
    @required this.description,
    @required this.imgPath,
    @required this.power,
    @required this.range,
    @required this.seats,
    @required this.brand,
    @required this.rating,
    @required this.type,
    @required this.ownerEmail,
    this.id,
  });



  factory Car.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;


    return Car(
      id: document.id,
      name: data['name'],
      description: data['description'],
      imgPath: data['image_url'],
      power: data['power'],
      range: data['range'],
      seats: data['seats'],
      brand: data['brand'],
      rating: data['rating'],
      type: data['type'],
      ownerEmail: data['ownerEmail'],
    );

  }

}

