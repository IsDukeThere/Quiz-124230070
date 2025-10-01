import 'package:flutter/material.dart';
import 'package:kuis_mobile/data/food_list.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailPage extends StatefulWidget {
  final String name;
  const DetailPage({super.key, required this.name});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final pesan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final menu = dummyFoods.firstWhere(
      (g) => g.name == widget.name,
      orElse: () => dummyFoods[0],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 149, 6),
        foregroundColor: Colors.white,
        title: Text("Detail Menu", style: TextStyle(fontFamily: 'Motiva')),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 214, 138)
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 80,  
              child: Column(
                children: [
                  Image.network(
              menu.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(menu.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text(menu.category)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rp.${menu.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Kalori ${menu.calories}")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, 
                    vertical: 10
                  ),
                  width: 400,
                  child: TextButton(
                  onPressed: () {
                    _launchURL(menu.recipeUrl);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 7, 189, 255)
                      ),
                      shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Lihat Resep",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ),
                ),
            )
              ],
            ),
            Row(
              children: [
                _pesanan()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, 
                    vertical: 10
                  ),
                  width: 400,
                  child: TextButton(
                  onPressed: () {
                    _checkout();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 7, 189, 255)
                      ),
                      shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ),
                ),
            )
              ],
            ),
              ],
            )
        ),
      );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget _pesanan() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        // keyboardType: numb,
        enabled: true,
        controller: pesan,
        style: TextStyle(
          color: Color.fromARGB(255, 72, 74, 74),
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          hintText: "Jumlah Pesanan",
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 72, 74, 74),
            // fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }

  // void _checkout(){
  //   int pesan;
  //   int jumlah = menu.price*pesan;
  //   print(jumlah);

  // }
}