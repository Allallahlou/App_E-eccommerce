import 'package:flutter/material.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

class WatchTypesScreen extends StatelessWidget {
  const WatchTypesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("أنواع الساعات", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExpandableCard(
              title: "الساعات الفاخرة",
              details: ["Rolex", "Patek Philippe", "Audemars Piguet", "Omega"],
            ),
            _buildExpandableCard(
              title: "الساعات الذكية",
              details: [
                "Apple Watch",
                "Samsung Galaxy Watch",
                "Garmin",
                "Fitbit"
              ],
            ),
            _buildExpandableCard(
              title: "الساعات الرياضية",
              details: ["Garmin", "Suunto", "Polar", "Casio G-Shock"],
            ),
            _buildExpandableCard(
              title: "الساعات الكلاسيكية",
              details: ["Seiko", "Tissot", "Citizen", "Longines"],
            ),
            _buildExpandableCard(
              title: "الساعات الرقمية",
              details: ["Casio G-Shock", "Timex", "Fossil", "Diesel"],
            ),
          ],
        ),
      ),
    );
  }

  // دالة لإنشاء بطاقة منسدلة لكل نوع من أنواع الساعات
  Widget _buildExpandableCard(
      {required String title, required List<String> details}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TapToExpand(
        curve: Curves.easeInOut,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details
              .map((watch) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "- $watch",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ))
              .toList(),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        closedHeight: 60,
        openedHeight: 180,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
