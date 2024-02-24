import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_gemini.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider with ChangeNotifier {
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromwho: Fromwho.me);
    messageList.add(newMessage);

    if (text.endsWith('')) {
      await herReply(text);
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String question) async {
    final answer = await _getYesNoAnswer.getAnswer(question);
    final newMessage = Message(text: answer, fromwho: Fromwho.hers);
    messageList.add(newMessage);
  }


 


  void moveScrollToBottom() {
    // Tu implementación aquí...


  }

}