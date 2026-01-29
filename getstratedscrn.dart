import 'package:flutter/material.dart';
import 'package:flutter_application_1/weatherapp/openscrn.dart';
import 'package:lottie/lottie.dart';

class startedscrn extends StatelessWidget {
  const startedscrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 25, 25, 112),
              Colors.deepPurple,
              Colors.blueAccent,
              // Color.fromRGBO(192, 192, 192, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              "https://lottie.host/6c2822ec-8d0c-401f-90dc-5a3ca56b063e/yBaYCwqqCM.json",
            ),

            //  Image.asset('assets/images/weatherimg.jpg',
            //   height: 200,
            //   width: 200,
            //   fit: BoxFit.contain,
            //  ),
            SizedBox(height: 15),
            Text(
              'Sky - Cast',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome To Sky-Cast Weather App...',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => openscreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(192, 192, 192, 1.0),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
