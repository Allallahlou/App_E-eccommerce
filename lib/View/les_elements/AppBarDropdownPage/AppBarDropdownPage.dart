import 'package:flutter/material.dart';

class AppBarDropdownPage extends StatelessWidget {
  const AppBarDropdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("AppBar with Dropdown"),
        actions: [
          DropdownButton<String>(
            underline: Container(),
            icon: Icon(Icons.more_vert, color: Colors.white),
            items: const [
              DropdownMenuItem(
                child: Text('فئة الرجال'),
                value: 'men',
              ),
              DropdownMenuItem(
                child: Text('فئة النساء'),
                value: 'women',
              ),
              DropdownMenuItem(
                child: Text('فئة الأطفال'),
                value: 'children',
              ),
              DropdownMenuItem(
                child: Text('فئة البنات'),
                value: 'girls',
              ),
              DropdownMenuItem(
                child: Text('فئة الساعات الرياضية'),
                value: 'sportsWatches',
              ),
              DropdownMenuItem(
                child: Text('الساعات العمل'),
                value: 'workWatches',
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: value),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text("اختر فئة من القائمة العلوية"),
      ),
    );
  }
}

// صفحة الفئة المختارة
class CategoryPage extends StatelessWidget {
  final String category;
  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text("صفحة الفئة: $category"),
      ),
    );
  }
}