import 'package:flutter/material.dart';
import '../data/vocabulary_data.dart';

class HomeScreen extends StatefulWidget {
  final void Function(int) onStartQuiz;
  const HomeScreen({super.key, required this.onStartQuiz});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _selectedChapter = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chapter = _selectedChapter.toInt();
    final vocabCount = VocabularyData.getVocabUpToChapter(chapter).length;
    final sentenceCount = VocabularyData.getSentencesUpToChapter(chapter).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text('📖 Madina Arabic\nBook 1 Quiz',
            style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text('دروس اللغة العربية', style: theme.textTheme.headlineSmall, textAlign: TextAlign.center),
          const SizedBox(height: 32),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Text('How many chapters have you learned?',
                  style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text('Chapter 1 → $chapter',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
                const SizedBox(height: 8),
                Slider(
                  value: _selectedChapter,
                  onChanged: (v) => setState(() => _selectedChapter = v),
                  min: 1, max: VocabularyData.maxChapter.toDouble(),
                  divisions: VocabularyData.maxChapter - 1, label: chapter.toString(),
                ),
                const SizedBox(height: 8),
                Text('Available: $vocabCount vocab words, $sentenceCount sentences',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            color: theme.colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Quiz Format:', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('• 35 randomized vocabulary questions'),
                const Text('  → English to Arabic & Arabic to English',
                  style: TextStyle(fontSize: 12)),
                const Text('• 5 sentence ḥarakāt questions'),
                const Text('  → Add ḥarakāt & translate', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                const Text('✏️ Drawing scratch pad supported'),
              ]),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity, height: 56,
            child: FilledButton(
              onPressed: () => widget.onStartQuiz(chapter),
              child: const Text('Start Quiz 🚀',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}