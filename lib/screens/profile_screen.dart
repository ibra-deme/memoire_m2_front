import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  // Informations de l'utilisateur (vous pouvez les remplacer par des données dynamiques)
  final String firstName = 'Ibra';
  final String lastName = 'Deme';
  final String email = 'diengdeguene87@gmail.com';

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
                    // Icône de profil
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.teal[700],
                    ),
                    SizedBox(height: 20),
                    // Texte principal
                    Text(
                      'Profil de l\'utilisateur',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Affichage des informations de l'utilisateur
                    _buildInfoRow('Prénom', firstName),
                    SizedBox(height: 16),
                    _buildInfoRow('Nom', lastName),
                    SizedBox(height: 16),
                    _buildInfoRow('Email', email),
                    SizedBox(height: 16),
                    // Ajout d'autres informations si nécessaire
                    _buildInfoRow('Mot de passe', '********'),
                    SizedBox(height: 30),
                    // Bouton de déconnexion ou autre action
                    ElevatedButton(
                      onPressed: () {
                        // Logique de déconnexion
                        Navigator.pop(context);
                      },
                      child: Text('Se déconnecter'),
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

  // Widget pour afficher les informations sous forme de ligne stylisée
  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Text(
            '$label : ',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.teal[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
