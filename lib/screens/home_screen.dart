// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Bibliothèque pour un joli BottomNavigationBar animé
// import 'home_content.dart';
// import 'profile_screen.dart';
// import 'chatbot_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _widgetOptions = <Widget>[
//     HomeContent(),
//     ProfileScreen(),
//     ChatbotScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Orientation Éducative Sénégal',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         backgroundColor: Colors.teal[700],
//         elevation: 0,
//       ),
//       body: AnimatedSwitcher(
//         duration: Duration(milliseconds: 500),
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         color: Colors.teal[700]!,
//         backgroundColor: Colors.transparent,
//         buttonBackgroundColor: Colors.teal[300]!,
//         height: 60,
//         animationDuration: Duration(milliseconds: 300),
//         items: <Widget>[
//           Icon(Icons.home, size: 30, color: Colors.white),
//           Icon(Icons.person, size: 30, color: Colors.white),
//           Icon(Icons.message, size: 30, color: Colors.white),
//         ],
//         index: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Bibliothèque pour un joli BottomNavigationBar animé
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
    ProfileScreen(),
    ChatbotScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            child: CircleAvatar(
              backgroundColor: Colors.teal[300],
              child: Text(
                firstLetter,
                style: TextStyle(color: Colors.white, fontSize: 20),
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
