import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typewsp/config/theme/app_theme.dart';
import 'package:typewsp/presentation/providers/chat_provider.dart';
import 'package:typewsp/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          title: 'typewsp',
          theme: Apptheme().theme(),
          debugShowCheckedModeBanner: false,
          home: chatScreen()),
    );
  }
}
