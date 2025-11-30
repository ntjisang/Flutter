import 'package:flutter/material.dart';

class DakarPage extends StatelessWidget {
  const DakarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFfCA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFfCA),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Image.asset('assets/loge.png', height: 30),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sen',
                    style: TextStyle(
                      color: Color.fromARGB(255, 242, 219, 7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'Logement',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 35),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Menu cliqué 🏠")));
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // BARRE DE RECHERCHE
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Adresse, ville, quartier...",
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.black),
                    onPressed: () => print("Filtre cliqué"),
                  ),
                ),
              ],
            ),
          ),

          // LISTE DES MAISONS
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
              childAspectRatio: 0.65,
              children: [
                buildHouseCard(
                  imageUrl: "assets/img/maison1.JPG",
                  price: "5 000 000 fCFA",
                  location: "Dakar, Parcelles Assainies",
                ),
                buildHouseCard(
                  imageUrl: "assets/img/maison2.JPG",
                  price: "7 000 000 fCFA",
                  location: "Dakar, Mermoz",
                ),
                buildHouseCard(
                  imageUrl: "assets/img/maison3.JPG",
                  price: "6 000 000 fCFA",
                  location: "Dakar, Cité Keur Guorgui",
                ),
                buildHouseCard(
                  imageUrl: "assets/img/maison4.JPG",
                  price: "10 000 000 fCFA",
                  location: "Dakar, Almadies",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///  WIDGET CARTE MAISON
Widget buildHouseCard({
  required String imageUrl,
  required String price,
  required String location,
}) {
  return Container(
    width: 160,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.favorite_border, color: Colors.white, size: 28),
            ),
          ],
        ),
        const SizedBox(height: 8),

        Text(
          price,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        Text(
          location,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
        ),
      ],
    ),
  );
}
