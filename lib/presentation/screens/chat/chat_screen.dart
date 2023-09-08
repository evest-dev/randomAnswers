import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typewsp/domain/entities/message.dart';
import 'package:typewsp/presentation/providers/chat_provider.dart';
import 'package:typewsp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:typewsp/presentation/widgets/shared/message_field_box.dart';

import '../../widgets/chat/this_message_bubble.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 14),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tvazteca.brightspotcdn.com/dims4/default/d8d9c0b/2147483647/strip/true/crop/1920x1008+0+36/resize/1200x630!/quality/90/?url=http%3A%2F%2Ftv-azteca-brightspot.s3.amazonaws.com%2F56%2F80%2F4279e1ec484fb94da5bf22d72fcd%2F9-mayo-dia-de-goku.jpg')),
        ),
        title: const Text('Son Goku'),
        centerTitle: false,
      ),
      body: _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.her)
                      ? ThisMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(message: message);
                },
              )),
              // Caja de Texto
              MessageFieldBox(
                onValue: chatProvider.sendMessage,
              ),
            ],
          )),
    );
  }
}
