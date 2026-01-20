import 'package:flutter/material.dart';
import 'maison.dart';

class FavorisPage extends StatelessWidget {
  final List<Maison> favoris;

  const FavorisPage({super.key, required this.favoris});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Favoris"),
        centerTitle: true,
      ),
      body: favoris.isEmpty
          ? const Center(child: Text("Aucun favori pour le moment 😔"))
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 12, mainAxisSpacing: 20),
        itemCount: favoris.length,
        itemBuilder: (context, index) {
          final maison = favoris[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        },
      ),
    );
  }
}
