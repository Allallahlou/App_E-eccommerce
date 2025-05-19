// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:app_e_ecommerce/View/language/language_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  late types.User _user;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
    _user = const types.User(id: 'user123');

    // ✅ مراقبة الكيبورد
    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (visible && _showEmojiPicker) {
        setState(() {
          _showEmojiPicker = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
    );
    _addMessage(message);
    _controller.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _showEmojiPicker = false;
    });
  }

  void _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
        setState(() {
          _showEmojiPicker = false;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            languageProvider.currentLocale.languageCode == 'en'
                ? "Support"
                : "دعم",
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing: .5,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // ✅ رسائل الدردشة
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index] as types.TextMessage;
                  final isMe = message.author.id == _user.id;
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isMe
                            ? Colors.pinkAccent.shade100
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ✅ لوحة الإيموجي
            if (_showEmojiPicker)
              SizedBox(
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

            // ✅ حقل الكتابة
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined,
                        color: Colors.pinkAccent),
                    onPressed: () {
                      setState(() {
                        _showEmojiPicker = !_showEmojiPicker;
                        if (_showEmojiPicker) {
                          FocusScope.of(context).unfocus(); // يغلق الكيبورد
                        } else {
                          FocusScope.of(context)
                              .requestFocus(_focusNode); // يفتح الكيبورد
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (text) => _sendMessage(text),
                        onTap: () {
                          setState(() {
                            _showEmojiPicker = false;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              languageProvider.currentLocale.languageCode ==
                                      'en'
                                  ? "Type a message"
                                  : "اكتب رسالة",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.pinkAccent),
                    onPressed: () => _sendMessage(_controller.text),
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
