import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'text': message, 'sender': 'user'});
    });

    // Faire défiler vers le bas après l'ajout d'un nouveau message
    _scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/chat'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'message': message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _messages.add({'text': data['response'], 'sender': 'bot'});
        });
      } else {
        setState(() {
          _messages.add({'text': 'Erreur du serveur', 'sender': 'bot'});
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({'text': 'Erreur de connexion', 'sender': 'bot'});
      });
    }

    // Faire défiler vers le bas après la réponse du bot
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Colors.teal
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['text']!,
                        style: TextStyle(
                          color: message['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tapez un message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ChatbotScreen extends StatefulWidget {
//   final int userId; // Ajout de l'ID utilisateur

//   ChatbotScreen({required this.userId});

//   @override
//   _ChatbotScreenState createState() => _ChatbotScreenState();
// }

// class _ChatbotScreenState extends State<ChatbotScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, dynamic>> _messages = []; // Inclure date et heure
//   final ScrollController _scrollController = ScrollController();

//   Future<void> _sendMessage(String message) async {
//     final timestamp = DateTime.now().toString();

//     setState(() {
//       _messages.add({
//         'text': message,
//         'sender': 'user',
//         'timestamp': timestamp, // Ajout de l'heure pour l'utilisateur
//       });
//     });

//     // Faire défiler vers le bas après l'ajout d'un nouveau message
//     _scrollToBottom();

//     try {
//       final response = await http.post(
//         Uri.parse('http://127.0.0.1:5000/chat'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'message': message,
//           'user_id': widget.userId,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _messages.add({
//             'text': data['response'],
//             'sender': 'bot',
//             'timestamp': DateTime.now().toString(), // Timestamp pour le bot
//           });
//         });
//       } else {
//         setState(() {
//           _messages.add({
//             'text': 'Erreur du serveur',
//             'sender': 'bot',
//             'timestamp': timestamp,
//           });
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _messages.add({
//           'text': 'Erreur de connexion',
//           'sender': 'bot',
//           'timestamp': timestamp,
//         });
//       });
//     }

//     // Faire défiler vers le bas après la réponse du bot
//     _scrollToBottom();
//   }

//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//     });
//   }

//   String _formatTimestamp(String timestamp) {
//     final dateTime = DateTime.parse(timestamp);
//     return "${dateTime.hour}:${dateTime.minute}"; // Format HH:MM
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chatbot'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return ListTile(
//                   title: Align(
//                     alignment: message['sender'] == 'user'
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: message['sender'] == 'user'
//                             ? Colors.teal
//                             : Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: message['sender'] == 'user'
//                             ? CrossAxisAlignment.end
//                             : CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             message['text']!,
//                             style: TextStyle(
//                               color: message['sender'] == 'user'
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             _formatTimestamp(message['timestamp']),
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: 'Tapez un message',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       _sendMessage(_controller.text);
//                       _controller.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
