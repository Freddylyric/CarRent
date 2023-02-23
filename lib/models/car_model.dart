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
  });
}

