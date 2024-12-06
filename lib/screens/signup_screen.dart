// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   // Initialiser les contrôleurs avec les valeurs fournies
//   final TextEditingController _nameController =
//       TextEditingController(text: 'Ibra');
//   final TextEditingController _surnameController =
//       TextEditingController(text: 'Deme');
//   final TextEditingController _emailController =
//       TextEditingController(text: 'diengdeguene87@gmail.com');
//   final TextEditingController _passwordController =
//       TextEditingController(text: 'ibrademe');

//   void _register() {
//     // Logique d'inscription ici
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Arrière-plan avec dégradé
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.teal.shade200, Colors.teal.shade900],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 width: double.infinity,
//                 constraints: BoxConstraints(maxWidth: 380),
//                 padding: const EdgeInsets.all(24.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 30,
//                       offset: Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     // Icône de profil
//                     Icon(
//                       Icons.account_circle,
//                       size: 100,
//                       color: Colors.teal[700],
//                     ),
//                     SizedBox(height: 20),
//                     // Texte principal
//                     Text(
//                       'Créer un Compte',
//                       style: GoogleFonts.poppins(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
//                     // Champs de texte stylisés avec les valeurs préremplies
//                     _buildTextField(
//                       controller: _nameController,
//                       label: 'Prénom',
//                       icon: Icons.person,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _surnameController,
//                       label: 'Nom',
//                       icon: Icons.person_outline,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _emailController,
//                       label: 'Email',
//                       keyboardType: TextInputType.emailAddress,
//                       icon: Icons.email,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _passwordController,
//                       label: 'Mot de passe',
//                       obscureText: true,
//                       icon: Icons.lock,
//                     ),
//                     SizedBox(height: 24),
//                     // Bouton d'inscription
//                     ElevatedButton(
//                       onPressed: _register,
//                       child: Text('S\'inscrire'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal[700],
//                         foregroundColor: Colors.white,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 60, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 8,
//                         textStyle: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//     required IconData icon,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: GoogleFonts.poppins(color: Colors.teal[700]),
//         filled: true,
//         fillColor: Colors.grey.shade200,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Icon(icon, color: Colors.teal[700]),
//         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _surnameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _register() async {
//     final response = await http.post(
//       Uri.parse(
//           'http://127.0.0.1:5000/register'), // Remplacez par l'URL de votre serveur
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: json.encode(<String, String>{
//         'nom': _nameController.text,
//         'prenom': _surnameController.text,
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     if (response.statusCode == 200) {
//       // Si l'inscription est réussie, vous pouvez naviguer vers l'écran de connexion ou afficher un message
//       Navigator.pop(context);
//     } else {
//       // Afficher un message d'erreur si l'inscription échoue
//       final errorResponse = jsonDecode(response.body);
//       _showErrorDialog(errorResponse['message']);
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Erreur'),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Arrière-plan avec dégradé
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.teal.shade200, Colors.teal.shade900],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 width: double.infinity,
//                 constraints: BoxConstraints(maxWidth: 380),
//                 padding: const EdgeInsets.all(24.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 30,
//                       offset: Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     // Icône de profil
//                     Icon(
//                       Icons.account_circle,
//                       size: 100,
//                       color: Colors.teal[700],
//                     ),
//                     SizedBox(height: 20),
//                     // Texte principal
//                     Text(
//                       'Créer un Compte',
//                       style: GoogleFonts.poppins(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
//                     // Champs de texte stylisés
//                     _buildTextField(
//                       controller: _nameController,
//                       label: 'Prénom',
//                       icon: Icons.person,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _surnameController,
//                       label: 'Nom',
//                       icon: Icons.person_outline,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _emailController,
//                       label: 'Email',
//                       keyboardType: TextInputType.emailAddress,
//                       icon: Icons.email,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _passwordController,
//                       label: 'Mot de passe',
//                       obscureText: true,
//                       icon: Icons.lock,
//                     ),
//                     SizedBox(height: 24),
//                     // Bouton d'inscription
//                     ElevatedButton(
//                       onPressed: _register,
//                       child: Text('S\'inscrire'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal[700],
//                         foregroundColor: Colors.white,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 60, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 8,
//                         textStyle: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//     required IconData icon,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: GoogleFonts.poppins(color: Colors.teal[700]),
//         filled: true,
//         fillColor: Colors.grey.shade200,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: Icon(icon, color: Colors.teal[700]),
//         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'nom': _nameController.text,
          'prenom': _surnameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Inscription réussie
        _showSuccessDialog();
      } else {
        // Affiche un message d'erreur avec la réponse du serveur
        final errorResponse = jsonDecode(response.body);
        _showErrorDialog(errorResponse['message'] ?? 'Erreur du serveur');
      }
    } catch (e) {
      _showErrorDialog('Erreur de connexion : $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Inscription réussie'),
          content: Text('Votre compte a été créé avec succès !'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erreur'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                    Icon(Icons.account_circle,
                        size: 100, color: Colors.teal[700]),
                    SizedBox(height: 20),
                    Text(
                      'Créer un Compte',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                        controller: _nameController,
                        label: 'Prénom',
                        icon: Icons.person),
                    SizedBox(height: 16),
                    _buildTextField(
                        controller: _surnameController,
                        label: 'Nom',
                        icon: Icons.person_outline),
                    SizedBox(height: 16),
                    _buildTextField(
                        controller: _emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email),
                    SizedBox(height: 16),
                    _buildTextField(
                        controller: _passwordController,
                        label: 'Mot de passe',
                        obscureText: true,
                        icon: Icons.lock),
                    SizedBox(height: 24),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _register,
                            child: Text('S\'inscrire'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal[700],
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.teal[700]),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(icon, color: Colors.teal[700]),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
