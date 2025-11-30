import 'package:flutter/material.dart';
import 'Dakar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 235, 235),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Header (localisation + profil)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 255, 192, 1),
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "N'Tji SANGARE",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      "https://scontent.fdkr6-1.fna.fbcdn.net/v/t1.6435-9/75388070_2986707258221967_4723317518440071168_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFzWnDyDps6YBCb3b4U34lF3uEGXfqAPLDe4QZd-oA8sHLP62Pm9GbZqCg73w5BmV-k3FcIqcNZ22jjqYJxQgxP&_nc_ohc=vJLU79UVMIwQ7kNvwG27XMW&_nc_oc=AdmpmDFiAHLc5VmNNZysFNDX9dAHDrKGIdVBsxgDBlyOpkZd5QNEQfK2urQXGuZc8JGcn2u7vnv6kLNHV0UX6Is2&_nc_zt=23&_nc_ht=scontent.fdkr6-1.fna&_nc_gid=06qbltTe-iNSu0ReogeP0w&oh=00_Afe3-WyegyIx57qQzLIejZFwGAq7Hr5Efmp5eiDFmMbFRA&oe=692593F5",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //  Titre principal + bouton filtre
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Nous trouverons la maison qu'il vous faut, dans la region de votre choix",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.filter_list, color: Colors.amber),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //  Liste des maisons
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DakarPage()),
                        );
                      },
                      child: HouseCard(
                        imageUrl:
                            "https://discover-senegal.com/wp-content/uploads/2019/05/Monument_de_la_Renaissance_africaine2-2.jpg",
                        title: "DAKAR",
                        address: "SENLOGEMENT, No. 4",
                        price: "850.000 IDR/month",
                        tags: ["Capitale", "Belle ville", "Et Jolie"],
                      ),
                    ),
                    SizedBox(height: 16),
                    HouseCard(
                      imageUrl:
                          "https://laviesenegalaise.com/wp-content/uploads/2025/01/Cite-Lamy-de-Thies-quartier-le-plus-propre-au-Senegal-1.jpg",
                      title: "THIES",
                      address: "Jl. Sigura-gura VI, No. 14",
                      price: "1.050.000 IDR/month",
                      tags: ["1 er region", "Self", "Wifi"],
                    ),
                    SizedBox(height: 16),
                    HouseCard(
                      imageUrl:
                          "https://lequotidien.sn/wp-content/uploads/2023/06/louga-1.jpg",
                      title: "LOUGA",
                      address: "Jl. Kalpataru No. 7",
                      price: "950.000 IDR/month",
                      tags: ["2 eme Region", "Shared", "AC"],
                    ),
                    SizedBox(height: 16),
                    HouseCard(
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Saintlouis_ile_pecheur.jpg/1024px-Saintlouis_ile_pecheur.jpg",
                      title: "SAINT LOUIS",
                      address: "Jl. Kalpataru No. 7",
                      price: "950.000 IDR/month",
                      tags: ["3 eme Region", "Shared", "AC"],
                    ),
                    SizedBox(height: 16),
                    HouseCard(
                      imageUrl:
                          "https://www.au-senegal.com/IMG/jpg/_ancienne_gouvernance_de_kaolack.jpg",
                      title: "KAOLACK",
                      address: "SENLOGEMENT, No. 12",
                      price: "780.000 IDR/month",
                      tags: ["4ème Région", "Centre", "Commerce"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://laviesenegalaise.com/wp-content/uploads/2019/02/Diourbel.jpg",
                      title: "DIOURBEL",
                      address: "SENLOGEMENT, No. 28",
                      price: "800.000 IDR/month",
                      tags: ["5ème Région", "Touba", "Sérénité"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://tourisme.gouv.sn/wp-content/uploads/2025/02/031-DSC_7676-1170x694.jpg",
                      title: "ZIGUINCHOR",
                      address: "SENLOGEMENT, No. 33",
                      price: "720.000 IDR/month",
                      tags: ["Sud", "Nature", "Paix"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://au-senegal.com/local/cache-gd2/6f/58c3c40317b5d0b7c49d57d3765c4e.jpg?1743588384",
                      title: "KOLDA",
                      address: "SENLOGEMENT, No. 18",
                      price: "700.000 IDR/month",
                      tags: ["Sud", "Agriculture", "Calme"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://laviesenegalaise.com/wp-content/uploads/2020/04/Tambacounda-Photo-Credit-Laura-Peterson.jpg",
                      title: "TAMBACOUNDA",
                      address: "SENLOGEMENT, No. 22",
                      price: "680.000 IDR/month",
                      tags: ["Est", "Grande région", "Sérénité"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://img.over-blog-kiwi.com/0/88/91/44/20160328/ob_89a020_matam.jpg",
                      title: "MATAM",
                      address: "SENLOGEMENT, No. 41",
                      price: "650.000 IDR/month",
                      tags: ["Nord-Est", "Fleuve", "Soleil"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://www.dakaractu.com/photo/art/grande/17832400-22200497.jpg?v=1508847606",
                      title: "KAFFRINE",
                      address: "SENLOGEMENT, No. 19",
                      price: "670.000 IDR/month",
                      tags: ["Centre", "Rural", "Tranquille"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://www.loger-dakar.com/wp-content/uploads/2024/01/Kedougou-Senegal1-3.jpg",
                      title: "KEDOUGOU",
                      address: "SENLOGEMENT, No. 55",
                      price: "700.000 IDR/month",
                      tags: ["Sud-Est", "Montagnes", "Tourisme"],
                    ),
                    SizedBox(height: 16),

                    HouseCard(
                      imageUrl:
                          "https://www.koldanews.com/wp-content/uploads/2020/10/Les-sinistres-des-inondations-de-la-region-de-Sedhiou-beneficient-dun-appui-de-60-millions-FCFA.jpg",
                      title: "SEDHIOU",
                      address: "SENLOGEMENT, No. 27",
                      price: "690.000 IDR/month",
                      tags: ["Sud", "Casamance", "Verte"],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  Widget Carte Maison
class HouseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String price;
  final List<String> tags;

  const HouseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.price,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFfCA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      address,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.local_offer,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      price,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: tags
                      .map(
                        (tag) => Chip(
                          label: Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          backgroundColor: Colors.grey.shade800,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
