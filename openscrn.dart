import 'package:flutter/material.dart';
import 'package:flutter_application_1/weatherapp/today.dart';
import 'package:flutter_application_1/weatherapp/weekly.dart';
import 'package:lottie/lottie.dart';

class openscreen extends StatefulWidget {
  const openscreen({super.key});

  @override
  State<openscreen> createState() => _openscreenState();
}

class _openscreenState extends State<openscreen> {
  final List<CityModel> cities = [
    CityModel(city: 'Paris', country: 'France', isSelected: true),
    CityModel(city: 'London', country: 'United Kingdom'),
    CityModel(city: 'Delhi', country: 'India'),
    CityModel(city: 'Tokyo', country: 'Japan'),
    CityModel(city: 'Seoul', country: 'South Korea'),
    CityModel(city: 'Bangkok', country: 'Thailand'),
    CityModel(city: 'Kochi', country: 'India'),
    CityModel(city: 'Monte Carlo', country: 'Monaco'),
  ];

  CityModel? selectedCity;

  
  final Map<String, Map<String, dynamic>> weatherData = {
    'Paris': {
      'temp': '18°',
      'condition': 'Cloudy',
      'lottie':
          'https://lottie.host/9f8788a2-d417-4816-a347-796f680add6a/CLnAIEy08X.json',
    },
    'London': {
      'temp': '15°',
      'condition': 'Rainy',
      'lottie':
          'https://lottie.host/192a729a-054f-435c-867c-94fd6949ddb9/U2V7xdzUIy.json',
    },
    'Delhi': {
      'temp': '34°',
      'condition': 'Sunny',
      'lottie':
          'https://lottie.host/49e4c9ff-049a-49fa-bd0b-772ff82a7206/tWJJnBduUs.json',
    },
    'Tokyo': {
      'temp': '22°',
      'condition': 'Windy',
      'lottie':
          'https://lottie.host/3d60258d-59df-4735-9893-01f0ff6d4f90/wfwEStKc4h.json',
    },
    'Seoul': {
      'temp': '19°',
      'condition': 'Snow',
      'lottie':
          'https://lottie.host/1e1736dd-862b-4e40-afde-7025f1f55f86/pv5OwMwSvl.json',
    },
    'Bangkok': {
      'temp': '30°',
      'condition': 'Humid',
      'lottie':
          'https://lottie.host/9f8788a2-d417-4816-a347-796f680add6a/CLnAIEy08X.json',
    },
    'Kochi': {
      'temp': '29°',
      'condition': 'Rainy',
      'lottie':
          'https://lottie.host/192a729a-054f-435c-867c-94fd6949ddb9/U2V7xdzUIy.json',
    },
    'Monte Carlo': {
      'temp': '21°',
      'condition': 'Clear',
      'lottie':
          'https://lottie.host/be67e22e-bc6c-42c7-8ef2-9d9d476d11f5/ZtkJ0H2uY8.json',
    },
  };

  @override
  void initState() {
    super.initState();
    selectedCity = cities.firstWhere(
      (c) => c.isSelected,
      orElse: () => cities.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cityWeather = weatherData[selectedCity!.city]!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 112),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu, color: Colors.white),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<CityModel>(
                        dropdownColor:
                            const Color.fromARGB(255, 25, 25, 112),
                        value: selectedCity,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: cities.map((city) {
                          return DropdownMenuItem(
                            value: city,
                            child: Text(
                              city.city,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (CityModel? value) {
                          if (value == null) return;
                          setState(() {
                            selectedCity = value;
                            for (var c in cities) {
                              c.isSelected = false;
                            }
                            value.isSelected = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                Column(
                  children: [
                    Lottie.network(
                      cityWeather['lottie'],
                      height: 130,
                    ),
                    Text(
                      cityWeather['temp'],
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      cityWeather['condition'],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      selectedCity!.city,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                TabBar(
                  indicatorColor: Colors.orange,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white60,
                  onTap: (index) {
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => weeks(
                            city: selectedCity!.city,
                            temp: cityWeather['temp'],
                            condition: cityWeather['condition'],
                            lottieUrl: cityWeather['lottie'],
                          ),
                        ),
                      );

                      DefaultTabController.of(context).animateTo(0);
                    }
                  },
                  tabs: [
                    Tab(text: 'Today'),
                    Tab(text: 'Tomorrow'),
                    Tab(text: 'Weekly'),
                  ],
                ),

               SizedBox(height: 10),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      tdyx(),
                      tdyx(),
                      SizedBox(), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//this is a model class for cities
class CityModel {
  final String city;
  final String country;
  bool isSelected;
  final bool isDefault;

  CityModel({
    required this.city,
    required this.country,
    this.isSelected = false,
    this.isDefault = false,
  });
}
