import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_app/domain/entities/messages.dart';
import 'package:yes_no_maybe_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/her_message_static_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/my_message_static_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://fakeperson-face.oss-us-west-1.aliyuncs.com/Face/male/male20161085952333985.jpg"),
          ),
        ),
        title: const Text("Love Chat 💗"),
      ),
      // body: const ChatViewStatic(),
      body: const _ChatView(),
    );
  }
}

// CHAT STATIC
class ChatViewStatic extends StatelessWidget {
  const ChatViewStatic({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const HerMessageStaticBubble()
                        : const MyMessageStaticBubble();
                  }),
            ),

            /// Caja de texto de mensajes
            MessageFieldBox(onValue: (value) => 'Static Value')
          ],
        ),
      ),
    );
  }
}

// CHAT DYNAMIC
class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  }),
            ),

            /// Caja de texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
