import 'package:flutter/material.dart';
import 'maison.dart';
import 'favoris_page.dart'; // Page des favoris

class MaisonsPage extends StatefulWidget {
  final String ville; // Exemple: Dakar, Thies...

  const MaisonsPage({super.key, required this.ville});

  @override
  State<MaisonsPage> createState() => _MaisonsPageState();
}

class _MaisonsPageState extends State<MaisonsPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  late List<Maison> maisonsFiltrees;

  final List<Maison> maisons = [
    Maison(
        imageUrl: "assets/img/maison1.JPG",
        price: 5000000,
        ville: "Dakar",
        quartier: "Almadies"),
    Maison(
        imageUrl: "assets/img/maison2.JPG",
        price: 7000000,
        ville: "Dakar",
        quartier: "Keur Massar"),
    Maison(
        imageUrl: "assets/img/maison3.JPG",
        price: 6000000,
        ville: "Thies",
        quartier: "Grand Standing"),
    Maison(
        imageUrl: "assets/img/maison4.JPG",
        price: 10000000,
        ville: "Saint-Louis",
        quartier: "Hydrobase"),
    // ajoute d'autres maisons ici
  ];

  @override
  void initState() {
    super.initState();
    maisonsFiltrees = maisons.where((m) => m.ville == widget.ville).toList();
  }

  void appliquerFiltres() {
    String query = searchController.text.toLowerCase();
    int minPrice = int.tryParse(minPriceController.text) ?? 0;
    int maxPrice = int.tryParse(maxPriceController.text) ?? 999999999;

    setState(() {
      maisonsFiltrees = maisons.where((maison) {
        return maison.ville == widget.ville &&
            maison.quartier.toLowerCase().contains(query) &&
            maison.price >= minPrice &&
            maison.price <= maxPrice;
      }).toList();
    });
  }

  List<String> getSuggestions() {
    return maisons
        .where((m) => m.ville == widget.ville)
        .map((m) => m.quartier)
        .toSet()
        .toList();
  }

  void ouvrirFavoris() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FavorisPage(
            favoris: maisons.where((m) => m.isFavorite).toList()),
      ),
    );
  }

  void ouvrirFiltreModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: minPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Prix min"),
                onChanged: (_) => appliquerFiltres(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: maxPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Prix max"),
                onChanged: (_) => appliquerFiltres(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  appliquerFiltres();
                  Navigator.pop(context); // ferme le modal
                },
                child: const Text("Appliquer les filtres"),
              ),
            ],
          ),
        );
      },
    );
  }

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
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Sen',
                    style: TextStyle(
                        color: Color.fromARGB(255, 242, 219, 7),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Logement',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: ouvrirFavoris, // ouvre la page Favoris
          ),
        ],
      ),
      body: Column(
        children: [
          // Barre de recherche + bouton filtre
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue value) {
                      return getSuggestions()
                          .where((s) => s
                          .toLowerCase()
                          .contains(value.text.toLowerCase()));
                    },
                    onSelected: (value) {
                      searchController.text = value;
                      appliquerFiltres();
                    },
                    fieldViewBuilder: (context, controller, focusNode, _) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        onChanged: (_) => appliquerFiltres(),
                        decoration: InputDecoration(
                          hintText: "Quartier (ex: Almadies)",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    },
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
                    onPressed: ouvrirFiltreModal,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Liste des maisons
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
              ),
              itemCount: maisonsFiltrees.length,
              itemBuilder: (context, index) {
                final maison = maisonsFiltrees[index];
                return buildHouseCard(maison);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHouseCard(Maison maison) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                maison.imageUrl,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  maison.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: maison.isFavorite ? Colors.red : Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    maison.isFavorite = !maison.isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(maison.isFavorite
                          ? "Ajouté aux favoris ❤️"
                          : "Retiré des favoris 💔"),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "${maison.price} FCFA",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "${maison.quartier}, ${maison.ville}",
          style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
        ),
      ],
    );
  }
}
