class CarItem{
  final String name;
  final String description;
  final String imgPath;
  final String power;
  final String range;
  final String seats;
  final String brand;

  CarItem({
    required this.name,
    required this.description,
    required this.imgPath,
    required this.power,
    required this.range,
    required this.seats,
    required this.brand,});
}

CarsList allCars = CarsList(cars:[
  CarItem(

    name: "Toyota Fortuner",
    description: "Toyota",
    imgPath: "assets/images/toyota.png",
    power: "Power",
    range: "Range",
    seats: "Seats",
    brand: 'Toyota',
  ),
  CarItem(
    name: "Suzuki Sandero",
    description: "Suzuki",
    imgPath: "assets/images/suzukiSandero.png",
    power: "Power",
    range: "Range",
    seats: "Seats",
    brand: 'Suzuki',

  ),
  CarItem(

    name: "Toyota Rav 4",
    description: "Toyota",
    imgPath: "assets/images/toyotaRav4.png",
    power: "Power",
    range: "Range",
    seats: "Seats",
    brand: 'Toyota',
  ),
  CarItem(

    name: "Toyota",
    description: "Toyota",
    imgPath: "assets/images/toyota.png",
    power: "Power",
    range: "Range",
    seats: "Seats",
    brand: 'Toyota',
  ),
  CarItem(

    name: "Toyota",
    description: "Toyota",
    imgPath: "assets/images/toyota.png",
    power: "Power",
    range: "Range",
    seats: "Seats",
    brand: 'Toyota',
  ),


]);
class CarsList{
  List <CarItem> cars;
  CarsList({required this.cars});
}