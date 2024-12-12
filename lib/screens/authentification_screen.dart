// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'signup_screen.dart';
// import 'home_screen.dart';

// class AuthenticationScreen extends StatefulWidget {
//   @override
//   _AuthenticationScreenState createState() => _AuthenticationScreenState();
// }

// class _AuthenticationScreenState extends State<AuthenticationScreen> {
//   // Informations de connexion préremplies
//   final TextEditingController _emailController =
//       TextEditingController(text: 'diengdeguene87@gmail.com');
//   final TextEditingController _passwordController =
//       TextEditingController(text: 'ibrademe');

//   void _authenticate() {
//     // Logique d'authentification ici
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => HomeScreen()),
//     );
//   }

//   void _navigateToSignup() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignupScreen()),
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
//                 colors: [Colors.teal, Colors.teal.shade900],
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
//                     // Icône à la place de l'illustration
//                     Icon(
//                       Icons.account_circle,
//                       size: 100,
//                       color: Colors.teal[700],
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Connectez-vous à votre compte',
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
//                     // Bouton de connexion avec dégradé
//                     ElevatedButton(
//                       onPressed: _authenticate,
//                       child: Text('Se connecter'),
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
//                     SizedBox(height: 16),
//                     // Texte pour créer un compte
//                     TextButton(
//                       onPressed: _navigateToSignup,
//                       child: Text(
//                         'Créer un compte',
//                         style: GoogleFonts.poppins(
//                           color: Colors.teal[700],
//                           fontWeight: FontWeight.w600,
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
import 'signup_screen.dart';
import 'home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  void _authenticate() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      // Envoi de la requête POST au serveur
      final response = await http.post(
        Uri.parse(
            'http://127.0.0.1:5000/login'), // Assurez-vous que l'URL correspond au backend
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      // Vérification du statut de la réponse
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Si la connexion est réussie
        if (data["message"] == "Login successful") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(email: email)
                // builder: (context) => HomeScreen()
                ),
          );
        } else {
          _showError("Erreur : ${data['message']}");
        }
      } else {
        _showError("Erreur de connexion. Veuillez réessayer.");
      }
    } catch (e) {
      _showError("Erreur réseau : $e");
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Erreur de connexion"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Arrière-plan avec dégradé
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.teal.shade900],
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
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.teal[700],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Connectez-vous à votre compte',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Mot de passe',
                      obscureText: true,
                      icon: Icons.lock,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _authenticate,
                      child: Text('Se connecter'),
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
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: _navigateToSignup,
                      child: Text(
                        'Créer un compte',
                        style: GoogleFonts.poppins(
                          color: Colors.teal[700],
                          fontWeight: FontWeight.w600,
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
