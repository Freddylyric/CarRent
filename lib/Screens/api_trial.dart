import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/vehicle.dart';

Future<List<Vehicle>> fetchVehicles() async {
  try {
    var response = await http.get(Uri.parse('http://localhost:8000/'));

    if (response.statusCode == 200) {
      var vehicles = <Vehicle>[];
      for (var v in jsonDecode(response.body)) {
        vehicles.add(Vehicle(
          v['id'],
          v['name'],
          v['price'],
          v['image_urls'],
          v['url'],
        ));
      }
      if (kDebugMode) {
        print(vehicles);
      }
      return vehicles;
    } else {
      throw Exception('Failed to fetch vehicles');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to fetch vehicles');
  }
}

class CarData extends StatefulWidget {
  const CarData({Key? key}) : super(key: key);

  @override
  _CarDataState createState() => _CarDataState();
}

class _CarDataState extends State<CarData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Vehicle>>(
        future: fetchVehicles(),
        builder: (BuildContext context, AsyncSnapshot<List<Vehicle>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(snapshot.data![index].name));
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
