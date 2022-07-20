import 'dart:convert';
import 'package:covid_tracker/components/url_box.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/country.dart';
import 'package:http/http.dart' as http;

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  // get countryName => _selected;

  List<CountryData> parseCountryData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CountryData>((json) => CountryData.fromJson(json))
        .toList();
  }

  late Future<List<SingleCountry>> singleCountry;
  SingleCountry? _selected;

  Future<List<SingleCountry>> getCountryName() async {
    final response =
        await http.get(Uri.https('disease.sh', '/v3/covid-19/countries'));
    if (response.statusCode == 200) {
      return parseData(response.body);
    } else {
      throw Exception("Server Error / Connection Lost");
    }
  }

  late Future<CountryData> fetchData;
  @override
  void initState() {
    super.initState();
    singleCountry = getCountryName();
  }

  String country = '';
  Future<CountryData> fetchDataFromApi() async {
    final response = await http
        .get(Uri.parse('https://disease.sh/v3/covid-19/countries/$country'));

    if (response.statusCode == 200) {
      return CountryData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Server Error / Connection Lost");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder<List<SingleCountry>>(
                  future: singleCountry,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton(
                        hint: const Text("Select a country"),
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(10.0),
                        focusColor: Colors.blue,
                        menuMaxHeight: 350.0,
                        value:
                            _selected, // If value is null hint will be displayed.
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selected = newValue as SingleCountry;
                            country = _selected!.country.toString();
                          });
                        },
                        items: snapshot.data
                            ?.map<DropdownMenuItem<SingleCountry>>(
                                (SingleCountry value) {
                          return DropdownMenuItem<SingleCountry>(
                            value: value,
                            child: Text(value.country.toString()),
                          );
                        }).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
        const DoctorPopup(),
        Flexible(
          flex: 6,
          child: FutureBuilder<CountryData>(
            future: fetchDataFromApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red[100],
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Confirmed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    NumberFormat.compact()
                                        .format(snapshot.data!.cases),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[100],
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Active",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    NumberFormat.compact()
                                        .format(snapshot.data!.active),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green[100],
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Recovered",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    NumberFormat.compact()
                                        .format(snapshot.data!.recovered),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Deaths",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    NumberFormat.compact()
                                        .format(snapshot.data!.deaths),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  List<SingleCountry> parseData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SingleCountry>((json) => SingleCountry.fromJson(json))
        .toList();
  }
}

class SingleCountry {
  String? country;

  SingleCountry({
    this.country,
  });

  SingleCountry.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = country;
    return data;
  }
}
