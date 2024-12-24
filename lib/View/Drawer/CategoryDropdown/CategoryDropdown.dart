import 'package:flutter/material.dart';

class CategoryDropdownAppBar extends StatefulWidget {
  @override
  _CategoryDropdownAppBarState createState() => _CategoryDropdownAppBarState();
}

class _CategoryDropdownAppBarState extends State<CategoryDropdownAppBar> {
  final Map<String, Widget> categories = {
    'رجال': MenWatchesPage(),
    'نساء': WomenWatchesPage(),
    'الأطفال': KidsWatchesPage(),
    'البنات': GirlsWatchesPage(),
    'الساعات الرياضية': SportWatchesPage(),
    'الساعات للعمل': WorkWatchesPage(),
  };

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          hint: const Text(
            "اختيار الفئة",
            style: TextStyle(color: Colors.white),
          ),
          dropdownColor: Colors.indigo,
          value: selectedCategory,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue!;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => categories[selectedCategory]!,
              ),
            );
          },
          items: categories.keys.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(
                category,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text(
          "اختر الفئة من القائمة في الأعلى",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MenWatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ساعات الرجال"),
      ),
      body: const Center(
        child: Text("عرض ساعات الرجال هنا"),
      ),
    );
  }
}

class WomenWatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ساعات النساء"),
      ),
      body: const Center(
        child: Text("عرض ساعات النساء هنا"),
      ),
    );
  }
}

class KidsWatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ساعات الأطفال"),
      ),
      body: const Center(
        child: Text("عرض ساعات الأطفال هنا"),
      ),
    );
  }
}

class GirlsWatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ساعات البنات"),
      ),
      body: const Center(
        child: Text("عرض ساعات البنات هنا"),
      ),
    );
  }
}

class SportWatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الساعات الرياضية"),
      ),
      body: const Center(
        child: Text("عرض الساعات الرياضية هنا"),
      ),
    );
  }
}

class WorkWatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الساعات للعمل"),
      ),
      body: const Center(
        child: Text("عرض الساعات للعمل هنا"),
      ),
    );
  }
}
