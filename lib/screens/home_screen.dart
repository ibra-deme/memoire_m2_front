import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Bibliothèque pour un joli BottomNavigationBar animé
import 'package:my_app/screens/authentification_screen.dart';
import 'home_content.dart';
import 'profile_screen.dart';
import 'chatbot_screen.dart';

class HomeScreen extends StatefulWidget {
  final String email; // Ajout du paramètre email

  HomeScreen(
      {required this.email}); // Constructeur modifié pour inclure l'email

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    SenEduBotInfoScreen(),
    ChatbotScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fonction de déconnexion
  void _logout() {
    // Logique pour la déconnexion, par exemple, vider les données de session
    // Si vous utilisez un package de gestion d'état comme `shared_preferences` ou `provider`,
    // vous pouvez ajouter la logique pour vider les informations de session ici.

    // Rediriger vers l'écran de connexion (AuthentificationScreen)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AuthenticationScreen(),
      ),
    );
    // Si vous n'utilisez pas de routes nommées, vous pouvez également faire comme suit :
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => AuthentificationScreen()),
    //     (route) => false,
    // );
  }

  // Afficher un dialogue de confirmation avant de se déconnecter
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text("Déconnexion"),
          content: Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: Text("Annuler", style: TextStyle(color: Colors.teal)),
            ),
            ElevatedButton(
              onPressed: () {
                _logout();
                // Fermer la boîte de dialogue après la déconnexion
              },
              child: Text("Déconnexion"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // Couleur du texte
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Récupère la première lettre de l'email
    String firstLetter =
        widget.email.isNotEmpty ? widget.email[0].toUpperCase() : '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orientation Éducative Sénégal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.teal[700],
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap:
                  _showLogoutDialog, // Ouvre la boîte de dialogue de déconnexion au clic
              child: CircleAvatar(
                backgroundColor: Colors.teal[300],
                child: Text(
                  firstLetter,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.teal[700]!,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.teal[300]!,
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.message, size: 30, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
