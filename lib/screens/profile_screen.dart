import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/chatbot_screen.dart';

class SenEduBotInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Arrière-plan avec dégradé
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade200, Colors.teal.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 380),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Icône de chatbot
                    Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.teal[700],
                    ),
                    SizedBox(height: 20),
                    // Titre principal
                    Text(
                      'Sen_edu_bot',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Description du chatbot
                    Text(
                      'Sen_edu_bot est un chatbot intelligent conçu pour aider les nouveaux bacheliers et étudiants sénégalais à naviguer dans le système éducatif.',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Explication des fonctionnalités du chatbot
                    _buildFeatureCard('📚 Orientation académique',
                        'Sen_edu_bot fournit des informations sur les différentes filières universitaires et les écoles supérieures au Sénégal.'),
                    SizedBox(height: 16),
                    _buildFeatureCard('💡 Aide à la procédure d\'inscription',
                        'Le chatbot guide les étudiants dans la procédure d\'inscription dans les universités et écoles du Sénégal.'),
                    SizedBox(height: 16),
                    _buildFeatureCard('🗓️ Calendrier académique',
                        'Sen_edu_bot informe les étudiants sur les dates importantes du calendrier académique sénégalais.'),
                    SizedBox(height: 16),
                    _buildFeatureCard('📍 Informations ',
                        'Il aide également les étudiants à trouver des informations  sur les établissements d\'enseignement supérieur.'),
                    SizedBox(height: 30),
                    // Bouton pour démarrer l\'interaction avec le chatbot
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatbotScreen(),
                          ),
                        );
                      },
                      child: Text('Commencer à discuter'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[700],
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 8,
                        textStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour afficher les fonctionnalités du chatbot sous forme de carte
  Widget _buildFeatureCard(String title, String description) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
