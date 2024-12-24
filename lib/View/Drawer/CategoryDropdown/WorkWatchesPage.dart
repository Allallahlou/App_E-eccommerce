import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkWatchesPage extends StatelessWidget {
  const WorkWatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (

        title: Text(

            "Language Information",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),


        centerTitle: true,
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language,
              size: 100,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            Text(
              'Welcome to the Language Information Screen!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
