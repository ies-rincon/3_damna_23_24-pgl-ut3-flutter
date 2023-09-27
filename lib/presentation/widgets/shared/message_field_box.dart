import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(25),
    );
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          print('Value de la caja de texto: $textValue');
          textController.clear();
        },
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textController,
        decoration: inputDecoration,
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          print('Submit Value: $value');
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
        },
        onChanged: (value) {
          print('Changed text Value: $value');
        },
        onTapOutside: (event) {
          focusNode.unfocus();
        },
      ),
    );
  }
}
