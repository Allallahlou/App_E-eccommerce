import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 // لإطلاق الروابط


class PortfolioScreen extends StatelessWidget {
  

  // قائمة المشاريع

  final List<Map<String, String>> projects = const [
    {
      "name": "E-Commerce App",
      "description": "Flutter project for online store                                       https://github.com/Allallahlou/App_E-eccommerce"
    },
      
    {
      "name": "Portfolio Website",
      "description": "Personal website using Flutter                                     https://allaldev.com/"},
    {
      "name": "Task Manager App",
      "description": "App to manage tasks and productivity"
    },
  ];

  // دالة فتح الروابط الخارجية

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {

      throw 'لا يمكن فتح الرابط $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text("MY PORTFOLIO"),
        centerTitle: true,
      ),
    

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            // الصورة الشخصية
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/photo1.png'),
               // ضع صورتك هنا
            ),

            const SizedBox(height: 15),

            // اسمك ووصف قصير
            const Text(
              "ALLAL LAHLOU",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutter Developer | UI/UX Designer",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                ),
            ),

            const SizedBox(height: 25),

            // روابط التواصل الاجتماعي

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.work),
                  color: Colors.pink,
                  iconSize: 30,
                  onPressed: () => _launchURL('https://linkedin.com'), // لينكدإن
                ),
                IconButton(
                  icon: const Icon(Icons.add_business),
                  color: Colors.blueAccent,
                  iconSize: 30,
                  onPressed: () => _launchURL('https://github.com'), // جيت هاب
                ),
                IconButton(
                  icon: const Icon(Icons.facebook),
                  color: Colors.blue,
                  iconSize: 30,
                  onPressed: () => _launchURL('https://facebook.com'), // فيسبوك
                ),
              ],
            ),

            const SizedBox(height: 20),

            // قسم المشاريع

            const Text(
              "My Projects",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold),
            ),

            const Divider(thickness: 1),

            // عرض المشاريع

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: ListTile(
                    leading: const Icon(
                      Icons.work_outline,
                      color: Colors.pink),
                    title: Text(projects[index]["name"]!),
                    subtitle: Text(projects[index]["description"]!),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
