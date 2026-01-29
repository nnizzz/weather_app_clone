import 'package:flutter/material.dart';
import 'package:flutter_application_1/weatherapp/openscrn.dart';
import 'package:lottie/lottie.dart';

class weeks extends StatefulWidget {
  final String city;
  final String condition;
  final String temp;
  final String lottieUrl;

  const weeks({
    super.key,
    required this.city,
    required this.condition,
    required this.temp,
    required this.lottieUrl,
  });

  @override
  State<weeks> createState() => _weeksState();
}

class _weeksState extends State<weeks> {
  @override
  Widget build(BuildContext context) {
     int selectedCityIndex = 0;


    final List lottieList = [
      'https://lottie.host/9f8788a2-d417-4816-a347-796f680add6a/CLnAIEy08X.json',
      'https://lottie.host/192a729a-054f-435c-867c-94fd6949ddb9/U2V7xdzUIy.json',
      'https://lottie.host/49e4c9ff-049a-49fa-bd0b-772ff82a7206/tWJJnBduUs.json',
      'https://lottie.host/3d60258d-59df-4735-9893-01f0ff6d4f90/wfwEStKc4h.json',
      'https://lottie.host/1e1736dd-862b-4e40-afde-7025f1f55f86/pv5OwMwSvl.json',
      'https://lottie.host/9f8788a2-d417-4816-a347-796f680add6a/CLnAIEy08X.json',
      'https://lottie.host/192a729a-054f-435c-867c-94fd6949ddb9/U2V7xdzUIy.json',
    ];

    final List days = ['Today', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final List temps = ['28°', '27°', '33°', '30°', '29°', '30°', '28°'];
    final List<String> feels = ['24°','22°','38°','29°','22°','34°','36°','28°',];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 112),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 25, 25, 112),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => openscreen()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.city,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text('Sunday, 8 May', style: TextStyle(color: Colors.white70)),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 155, 241),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.condition, style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10),
                      Text(
                        widget.temp,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Lottie.network(widget.lottieUrl, height: 80),
                ],
              ),
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoTile(
                  icon: Icons.air, 
                  label: 'Wind', 
                  value: '4 km/h'),
                _InfoTile(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '22%',
                ),
                _InfoTile(
                  icon: Icons.thermostat,
                  label: 'Feels like',
                  value: feels[selectedCityIndex],
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(
              '7-Day Forecast',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),

            ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        days[index],
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      Lottie.network(lottieList[index], height: 40),

                      Text(
                        temps[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
         SizedBox(height: 6),
        Text(label, style: TextStyle(color: Colors.white)),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
