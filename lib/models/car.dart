import 'dart:ffi';

class CarItem{
  final String name;
  final String description;
  final String imgPath;
  final String power;
  final String range;
  final double seats;
  final String brand;
  final double rating;
  final String type;

  CarItem({
    required this.name,
    required this.description,
    required this.imgPath,
    required this.power,
    required this.range,
    required this.seats,
    required this.brand,
    required this.rating,
    required this.type,});
}

CarsList allCars = CarsList(cars:[
  CarItem(

    name: "Toyota Fortuner",
    description: "Toyota",
    imgPath: "assets/images/toyota.png",
    power: "Power",
    range: "Range",
    seats: 5,
    brand: 'Toyota',
    rating: 4.5,
    type: 'Automatic',
  ),
  CarItem(
    name: "Suzuki Sandero",
    description: "Suzuki",
    imgPath: "assets/images/suzukiSandero.png",
    power: "Power",
    range: "Range",
    seats: 5,
    brand: 'Suzuki',
    rating: 4.5,
    type: 'Automatic',

  ),
  CarItem(

    name: "Toyota Rav 4",
    description: "Toyota",
    imgPath: "assets/images/toyotaRav4.png",
    power: "Power",
    range: "Range",
    seats: 5,
    brand: 'Toyota',
    rating: 4.5,
    type: 'Automatic',
  ),
  CarItem(

    name: "Toyota",
    description: "Toyota",
    imgPath: "assets/images/toyota.png",
    power: "Power",
    range: "Range",
    seats: 4,
    brand: 'Toyota',
    rating: 4.5,
    type: 'Electric',
  ),
  CarItem(

    name: "Toyota",
    description: "Toyota",
    imgPath: "assets/images/toyota.png",
    power: "Power",
    range: "Range",
    seats: 4,
    brand: 'Toyota',
    rating: 4.5, type: 'Electric',
  ),


]);
class CarsList{
  List <CarItem> cars;
  // List <CarItem> carsOnSearch;
  CarsList({required this.cars});


}