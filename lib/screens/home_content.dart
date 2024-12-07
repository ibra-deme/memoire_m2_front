// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // Importer le package url_launcher

// class HomeContent extends StatelessWidget {
//   // Liste des universités avec leurs noms et leurs liens
//   final List<Map<String, String>> universities = [
//     {
//       'name': 'UCAD (Université Cheikh Anta Diop)',
//       'url': 'https://www.ucad.sn',
//     },
//     {
//       'name': 'UGB (Université Gaston Berger)',
//       'url': 'https://www.ugb.sn',
//     },
//     {
//       'name': 'UADB (Université Alioune Diop )',
//       'url': 'https://www.uadb.edu.sn',
//     },
//     {
//       'name': 'UIDT (Université Iba Der THIAM de Thiès, )',
//       'url': 'https://www.univ-thies.sn',
//     },
//     {
//       'name': 'UASZ (Université Assane-Seck de Ziguinchor )',
//       'url': 'https://uasz.sn',
//     },
//     {
//       'name': 'UN-CHK ( Université Numerique Cheikh Hamidou kane )',
//       'url': 'https://www.unchk.sn',
//     },
//     {
//       'name': 'USSEIN ( Université du Sine Saloum El Hadji Ibrahima Niass )',
//       'url': 'https://www.unchk.sn',
//     },
//     {
//       'name': 'UAM ( Université Amadou Mactar Mbow )',
//       'url': 'http://uam.sn/',
//     },
//     // Ajoutez d'autres universités si nécessaire
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Bienvenue !',
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.teal[800],
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Découvrez les meilleures opportunités d\'études au Sénégal.',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//           ),
//           SizedBox(height: 30),

//           // Section Universités
//           _buildSection(
//             icon: Icons.school,
//             title: 'Top Universités',
//             description:
//                 'Trouvez les meilleures universités du Sénégal, de l\'UCAD à l\'UGB, offrant des formations variées dans plusieurs disciplines.',
//           ),
//           SizedBox(height: 20),

//           // Section Orientation
//           _buildSection(
//             icon: Icons.lightbulb_outline,
//             title: 'Conseils d\'Orientation',
//             description:
//                 'Profitez de nos guides pour choisir la bonne filière et réussir votre parcours académique.',
//           ),
//           SizedBox(height: 20),

//           // Section Programmes spéciaux
//           _buildSection(
//             icon: Icons.star_outline,
//             title: 'Programmes Spéciaux',
//             description:
//                 'Découvrez des programmes de bourses et des opportunités uniques pour les étudiants talentueux.',
//           ),
//           SizedBox(height: 40),

//           // Call to Action
//           ElevatedButton.icon(
//             onPressed: () {
//               // Logique de navigation ou d'action
//             },
//             icon: Icon(Icons.explore, color: Colors.white),
//             label: Text('Explorer Maintenant'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal[700],
//               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               textStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(height: 30),

//           // Section des cartes des universités
//           ...universities.map((university) {
//             return _buildUniversityCard(university);
//           }).toList(),
//         ],
//       ),
//     );
//   }

//   // Fonction pour construire une section avec icône, titre et description
//   Widget _buildSection({
//     required IconData icon,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.teal[50],
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 40, color: Colors.teal[600]),
//           SizedBox(width: 20),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal[800],
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   description,
//                   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Fonction pour créer une carte plus attrayante pour chaque université
//   Widget _buildUniversityCard(Map<String, String> university) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: InkWell(
//         onTap: () => _launchURL(university['url']!),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: LinearGradient(
//               colors: [Colors.teal[300]!, Colors.teal[600]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 30,
//                   child: Icon(Icons.school, size: 35, color: Colors.teal[600]),
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: Text(
//                     university['name']!,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Fonction pour lancer l'URL de l'université
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Impossible de lancer l\'URL';
//     }
//   }
// }
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';
import "universities_page.dart";

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool showUniversities = false;

  // Liste des universités avec leurs noms, leurs liens et URLs de logos
  final List<Map<String, String>> universities = [
    {
      'name': 'UCAD (Université Cheikh Anta Diop)',
      'url': 'https://www.ucad.sn',
      'logo':
          'data:image/png;base64,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',
    },
    {
      'name': 'UGB (Université Gaston Berger)',
      'url': 'https://www.ugb.sn',
      'logo':
          'data:image/png;base64,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',
    },
    {
      'name': 'UADB (Université Alioune Diop)',
      'url': 'https://www.uadb.edu.sn',
      'logo':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd2f5ZEky1yKU3lqTaBs3vJ8RIIJod9O6yuw&s',
    },
    {
      'name': 'UIDT (Université Iba Der THIAM de Thiès)',
      'url': 'https://www.univ-thies.sn',
      'logo':
          'data:image/jpeg;base64,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',
    },
    {
      'name': 'UASZ (Université Assane-Seck de Ziguinchor)',
      'url': 'https://uasz.sn',
      'logo':
          'data:image/jpeg;base64,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',
    },
    {
      'name': 'UN-CHK (Université Numérique Cheikh Hamidou Kane)',
      'url': 'https://www.unchk.sn',
      'logo':
          'data:image/png;base64,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',
    },
    {
      'name': 'USSEIN (Université du Sine Saloum El Hadji Ibrahima Niass)',
      'url': 'https://www.ussein.sn',
      'logo':
          'data:image/png;base64,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',
    },
    {
      'name': 'UAM (Université Amadou Mactar Mbow)',
      'url': 'http://uam.sn/',
      'logo':
          'data:image/png;base64,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',
    },
  ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Bienvenue Section
//           Text(
//             'Bienvenue !',
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.teal[800],
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Découvrez les meilleures opportunités d\'études au Sénégal.',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//           ),
//           SizedBox(height: 30),

//           // Sections avant le bouton
//           _buildSection(
//             icon: Icons.school,
//             title: 'Top Universités',
//             description:
//                 'Trouvez les meilleures universités du Sénégal, de l\'UCAD à l\'UGB, offrant des formations variées dans plusieurs disciplines.',
//           ),
//           SizedBox(height: 20),
//           _buildSection(
//             icon: Icons.lightbulb_outline,
//             title: 'Conseils d\'Orientation',
//             description:
//                 'Profitez de nos guides pour choisir la bonne filière et réussir votre parcours académique.',
//           ),
//           SizedBox(height: 20),
//           _buildSection(
//             icon: Icons.star_outline,
//             title: 'Programmes Spéciaux',
//             description:
//                 'Découvrez des programmes de bourses et des opportunités uniques pour les étudiants talentueux.',
//           ),
//           SizedBox(height: 40),
//           _buildSection(
//             icon: Icons.star_outline,
//             title: 'Universités Privées',
//             description: 'Découvrez les universités privées du senegal.',
//           ),
//           SizedBox(height: 40),

//           // Bouton Explorer Maintenant
//           ElevatedButton.icon(
//             onPressed: () {
//               setState(() {
//                 showUniversities = true;
//               });
//             },
//             icon: Icon(Icons.explore, color: Colors.white),
//             label: Text('Explorer Maintenant'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal[700],
//               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               textStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(height: 30),

//           // Liste des universités publiques
//           if (showUniversities) ...[
//             Text(
//               'Liste des universités publiques',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal[800],
//               ),
//             ),
//             SizedBox(height: 20),
//             ...universities.map((university) {
//               return _buildUniversityCard(university);
//             }).toList(),
//           ],
//         ],
//       ),
//     );
//   }

//   // Fonction pour construire une section
//   Widget _buildSection({
//     required IconData icon,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.teal[50],
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 40, color: Colors.teal[600]),
//           SizedBox(width: 20),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal[800],
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   description,
//                   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Fonction pour créer une carte pour chaque université
//   Widget _buildUniversityCard(Map<String, String> university) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: InkWell(
//         onTap: () => _launchURL(university['url']!),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(university['logo']!),
//                 radius: 30,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   university['name']!,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal[800],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Fonction pour lancer l'URL
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Impossible de lancer l\'URL';
//     }
//   }
// }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Bienvenue Section
          Text(
            'Bienvenue !',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Découvrez les meilleures opportunités d\'études au Sénégal.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 30),

          // Sections avant le bouton
          _buildSection(
            icon: Icons.school,
            title: 'Top Universités',
            description:
                'Trouvez les meilleures universités du Sénégal, de l\'UCAD à l\'UGB, offrant des formations variées dans plusieurs disciplines.',
            onTap: () {
              // Naviguer vers la nouvelle page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UniversitiesPage(universities: universities),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          _buildSection(
            icon: Icons.lightbulb_outline,
            title: 'Conseils d\'Orientation',
            description:
                'Profitez de nos guides pour choisir la bonne filière et réussir votre parcours académique.',
          ),
          SizedBox(height: 20),
          _buildSection(
            icon: Icons.star_outline,
            title: 'Programmes Spéciaux',
            description:
                'Découvrez des programmes de bourses et des opportunités uniques pour les étudiants talentueux.',
          ),
          SizedBox(height: 40),
          _buildSection(
            icon: Icons.star_outline,
            title: 'Universités Privées',
            description: 'Découvrez les universités privées du Sénégal.',
          ),
          SizedBox(height: 40),

          // Bouton Explorer Maintenant (sans la logique d'affichage)
          ElevatedButton.icon(
            onPressed: () {
              // Ajoutez ici des actions si nécessaire
            },
            icon: Icon(Icons.explore, color: Colors.white),
            label: Text('Explorer Maintenant'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[700],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String description,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.teal[600]),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
