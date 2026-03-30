import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MadinaArabicQuizApp());
}

class MadinaArabicQuizApp extends StatelessWidget {
  const MadinaArabicQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madina Arabic Quiz',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});
  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int? _selectedChapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _selectedChapter == null
            ? HomeScreen(
                onStartQuiz: (chapter) {
                  setState(() => _selectedChapter = chapter);
                },
              )
            : QuizScreen(
                maxChapter: _selectedChapter!,
                onFinish: () {
                  setState(() => _selectedChapter = null);
                },
              ),
      ),
    );
  }
}