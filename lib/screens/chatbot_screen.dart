// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ChatbotScreen extends StatefulWidget {
//   @override
//   _ChatbotScreenState createState() => _ChatbotScreenState();
// }

// class _ChatbotScreenState extends State<ChatbotScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> _messages = [];
//   final ScrollController _scrollController = ScrollController();

//   Future<void> _sendMessage(String message) async {
//     setState(() {
//       _messages.add({'text': message, 'sender': 'user'});
//     });

//     // Faire défiler vers le bas après l'ajout d'un nouveau message
//     _scrollToBottom();

//     try {
//       final response = await http.post(
//         Uri.parse('http://127.0.0.1:5000/chat'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{'message': message}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _messages.add({'text': data['response'], 'sender': 'bot'});
//         });
//       } else {
//         setState(() {
//           _messages.add({'text': 'Erreur du serveur', 'sender': 'bot'});
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _messages.add({'text': 'Erreur de connexion', 'sender': 'bot'});
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
//                       child: Text(
//                         message['text']!,
//                         style: TextStyle(
//                           color: message['sender'] == 'user'
//                               ? Colors.white
//                               : Colors.black,
//                         ),
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
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'text': message, 'sender': 'user'});
    });

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
        await _typeResponse(data['response']);
      } else {
        _addBotMessage('Erreur du serveur');
      }
    } catch (e) {
      _addBotMessage('Erreur de connexion');
    }

    _scrollToBottom();
  }

  Future<void> _typeResponse(String fullResponse) async {
    setState(() {
      _isTyping = true;
      _messages
          .add({'text': '', 'sender': 'bot'}); // Placeholder for bot message
    });

    String displayedText = '';
    List<String> words = fullResponse.split(' ');

    for (String word in words) {
      await Future.delayed(Duration(milliseconds: 100));
      displayedText += (displayedText.isEmpty ? '' : ' ') + word;
      setState(() {
        _messages.last['text'] = displayedText; // Update the last message
      });
      _scrollToBottom();
    }

    setState(() {
      _isTyping = false;
    });
  }

  void _addBotMessage(String message) {
    setState(() {
      _messages.add({'text': message, 'sender': 'bot'});
    });
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
        title: Text('Edu_bot'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade300,
              Colors.blue.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
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
            if (_isTyping)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Edu_bot est en train de taper...',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 23, 7, 7)),
                  ),
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
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.teal),
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
      ),
    );
  }
}
