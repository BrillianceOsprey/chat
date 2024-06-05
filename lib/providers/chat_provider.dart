import 'dart:math';
import 'package:chat/model/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<List<Message>> {
  ChatNotifier() : super([]);

  void addUserMessage(String text) {
    state = [...state, Message(text: text, isUserMessage: true)];
    addSystemMessage();
  }

  void addSystemMessage() {
    List<String> systemMessages = [
      "Hello! How can I assist you today?",
      "I'm here to help!",
      "What can I do for you?",
      "Please tell me more.",
      "Thank you for reaching out."
    ];
    String randomMessage =
        systemMessages[Random().nextInt(systemMessages.length)];
    state = [...state, Message(text: randomMessage, isUserMessage: false)];
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<Message>>((ref) {
  return ChatNotifier();
});
