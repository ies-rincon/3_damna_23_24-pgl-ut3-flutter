import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_maybe_app/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola mi amor 💗', fromWho: FromWho.me),
    Message(text: 'Hi love 💟', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    // TODO: Implementar método
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, // offset
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
