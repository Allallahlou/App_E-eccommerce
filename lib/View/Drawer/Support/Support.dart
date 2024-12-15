import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  late types.User _user;
  final TextEditingController _controller = TextEditingController();
  bool _showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
    _user = const types.User(id: 'user123');
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _sendMessage(String text) {
    if (text.isEmpty) return;
    final message = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
    );
    _addMessage(message);
    _controller.clear();
  }

  void _onEmojiSelected(Emoji emoji) {
    setState(() {
      _controller.text += emoji.emoji;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(

        title: Center(

          child: Text(

            "Support",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),
        ),
        ),

      body: Stack(
        children: [
          Chat(
            messages: _messages,
            onSendPressed: (message) {
              _sendMessage(message.text);
            },

            user: _user,

          ),

          // Emoji Picker

          if (_showEmojiPicker)
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    _onEmojiSelected(emoji);
                  },
                  config: const Config(
                    columns: 7,
                    emojiSizeMax: 32,
                  ),
                ),
              ),
            ),
        ],
      ),

      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions),
              onPressed: () {
                setState(() {
                  _showEmojiPicker = !_showEmojiPicker;
                }
                );
              },
            ),

            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Type a message',
                  ),
                onSubmitted: (text) => _sendMessage(text),
              ),
            ),
            
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _sendMessage(_controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
