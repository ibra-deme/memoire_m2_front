// import 'package:flutter/material.dart';

// class HomeContent extends StatelessWidget {
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
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importer le package url_launcher

class HomeContent extends StatelessWidget {
  // Liste des universités avec leurs noms et leurs liens
  final List<Map<String, String>> universities = [
    {
      'name': 'UCAD (Université Cheikh Anta Diop)',
      'url': 'https://www.ucad.sn',
    },
    {
      'name': 'UGB (Université Gaston Berger)',
      'url': 'https://www.ugb.sn',
    },
    {
      'name': 'UADB (Université Alioune Diop )',
      'url': 'https://www.uadb.edu.sn',
    },
    // Ajoutez d'autres universités si nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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

          // Section Universités
          _buildSection(
            icon: Icons.school,
            title: 'Top Universités',
            description:
                'Trouvez les meilleures universités du Sénégal, de l\'UCAD à l\'UGB, offrant des formations variées dans plusieurs disciplines.',
          ),
          SizedBox(height: 20),

          // Section Orientation
          _buildSection(
            icon: Icons.lightbulb_outline,
            title: 'Conseils d\'Orientation',
            description:
                'Profitez de nos guides pour choisir la bonne filière et réussir votre parcours académique.',
          ),
          SizedBox(height: 20),

          // Section Programmes spéciaux
          _buildSection(
            icon: Icons.star_outline,
            title: 'Programmes Spéciaux',
            description:
                'Découvrez des programmes de bourses et des opportunités uniques pour les étudiants talentueux.',
          ),
          SizedBox(height: 40),

          // Call to Action
          ElevatedButton.icon(
            onPressed: () {
              // Logique de navigation ou d'action
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

          // Section des cartes des universités
          ...universities.map((university) {
            return _buildUniversityCard(university);
          }).toList(),
        ],
      ),
    );
  }

  // Fonction pour construire une section avec icône, titre et description
  Widget _buildSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
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
    );
  }

  // Fonction pour créer une carte plus attrayante pour chaque université
  Widget _buildUniversityCard(Map<String, String> university) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => _launchURL(university['url']!),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.teal[300]!, Colors.teal[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.school, size: 35, color: Colors.teal[600]),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    university['name']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fonction pour lancer l'URL de l'université
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'URL';
    }
  }
}
