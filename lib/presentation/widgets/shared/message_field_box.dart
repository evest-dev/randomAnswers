import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    final inputDecoration = InputDecoration(
        hintText: 'End your mensaje whit a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print("Mensaje: $textValue");
            textController.clear();
            onValue(textValue);
          },
        ));
    return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: TextFormField(
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          focusNode: focusNode,
          decoration: inputDecoration,
          controller: textController,
          onFieldSubmitted: (value) {
            print("Submit value $value");
            textController.clear();
            focusNode.requestFocus();
            onValue(value);
          },
        ));
  }
}
