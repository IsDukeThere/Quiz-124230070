import 'package:flutter/material.dart';
import 'package:kuis_mobile/data/food_list.dart';
import 'package:kuis_mobile/pages/detail_page.dart';
import 'package:kuis_mobile/pages/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 77, 7),
        title: Text(
          "Warmindo Anindhita",
          style: TextStyle(color: Colors.white, fontFamily: 'Motiva'),
        ),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 214, 138)
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Halo, $username",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  
                  crossAxisCount: 1,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  return _menu(context, index);
                },
                itemCount: dummyFoods.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(name: dummyFoods[index].name);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 31, 44, 68),
          border: BoxBorder.all(width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(3, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 200,
              width: 80,
              child: Column(children: [Image.network(dummyFoods[index].image)]),
            ),
            Container(
              height: 200,
              padding: EdgeInsetsGeometry.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dummyFoods[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    dummyFoods[index].category,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
