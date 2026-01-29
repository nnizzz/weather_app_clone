import 'package:flutter/material.dart';

class tdyx extends StatefulWidget {
  const tdyx({super.key});

  @override
  State<tdyx> createState() => _tdyxState();
}

class _tdyxState extends State<tdyx> {
  int selectedIndex = 0;

  final List<HourlyWeather> hourlyData = [
    HourlyWeather(time: 'Now', temperature: '28°', icon: Icons.wb_cloudy_outlined),
    HourlyWeather(time: '10AM', temperature: '30°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '11AM', temperature: '30°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '12PM', temperature: '32°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '1PM', temperature: '33°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '2PM', temperature: '33°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '3PM', temperature: '32°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '4PM', temperature: '30°', icon: Icons.wb_sunny_outlined),
    HourlyWeather(time: '5PM', temperature: '28°', icon: Icons.wb_cloudy_outlined),
    HourlyWeather(time: '6PM', temperature: '24°', icon: Icons.air_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyData.length,
        itemBuilder: (context, index) {
          final item = hourlyData[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration:  Duration(milliseconds: 250),
              width: 80,
              margin:  EdgeInsets.only(right: 12),
              padding:  EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.deepOrange
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 12,
                  ),
                  Text(
                    item.temperature,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.time,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class HourlyWeather {
  final String time;
  final String temperature;
  final IconData icon;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.icon,
  });
}
