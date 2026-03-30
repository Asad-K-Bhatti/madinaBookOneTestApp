// lib/screens/quiz_screen.dart

import 'package:flutter/material.dart';
import '../models/models.dart';
import '../engine/quiz_engine.dart';
import 'drawing_canvas.dart';

class QuizScreen extends StatefulWidget {
  final int maxChapter;
  final VoidCallback onFinish;

  const QuizScreen({super.key, required this.maxChapter, required this.onFinish});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<QuizQuestion> _questions;
  int _currentIndex = 0;
  String _userAnswer = '';
  String _translationAnswer = '';
  bool _showResult = false;
  bool _isCorrect = false;
  bool _translationCorrect = false;
  int _score = 0;
  bool _showCanvas = false;

  final _answerController = TextEditingController();
  final _translationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _questions = QuizEngine.generateQuiz(widget.maxChapter);
  }

  @override
  void dispose() {
    _answerController.dispose();
    _translationController.dispose();
    super.dispose();
  }

  void _submitAnswer() {
    final question = _questions[_currentIndex];
    bool correct;
    bool transCorrect = false;

    if (question.type == QuestionType.sentenceHarakat) {
      final result = QuizEngine.checkSentenceHarakat(question, _userAnswer, _translationAnswer);
      correct = result.$1;
      transCorrect = result.$2;
      if (correct && transCorrect) _score++;
    } else {
      correct = QuizEngine.checkAnswer(question, _userAnswer);
      if (correct) _score++;
    }

    setState(() {
      _isCorrect = correct;
      _translationCorrect = transCorrect;
      _showResult = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex++;
      _userAnswer = '';
      _translationAnswer = '';
      _answerController.clear();
      _translationController.clear();
      _showResult = false;
      _isCorrect = false;
      _translationCorrect = false;
      _showCanvas = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) return _buildEmptyScreen(context);
    if (_currentIndex >= _questions.length) return _buildResultsScreen(context);
    return _buildQuestionScreen(context);
  }

  // ── RESULTS SCREEN ────────────────────────────────────────────────────────

  Widget _buildResultsScreen(BuildContext context) {
    final theme = Theme.of(context);
    final total = _questions.length;
    final percentage = total > 0 ? (_score * 100) ~/ total : 0;
    final isGood = percentage >= 70;

    final message = percentage >= 90
        ? 'ممتاز! Excellent! 🌟'
        : percentage >= 70
            ? 'جيد جداً! Very Good! 👍'
            : percentage >= 50
                ? 'Keep studying! واصل الدراسة 📚'
                : 'More practice needed! تحتاج مراجعة 💪';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🎉 Quiz Complete!',
              style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(children: [
                  Text(
                    '$_score / $total',
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isGood ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('$percentage%', style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  Text(message, style: theme.textTheme.titleMedium),
                ]),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: widget.onFinish,
                child: const Text('Return Home', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── EMPTY SCREEN ──────────────────────────────────────────────────────────

  Widget _buildEmptyScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No questions available for this chapter range.'),
          const SizedBox(height: 16),
          FilledButton(onPressed: widget.onFinish, child: const Text('Go Back')),
        ],
      ),
    );
  }

  // ── QUESTION SCREEN ───────────────────────────────────────────────────────

  Widget _buildQuestionScreen(BuildContext context) {
    final theme = Theme.of(context);
    final question = _questions[_currentIndex];
    final total = _questions.length;

    final isArabicPrompt = question.type == QuestionType.arabicToEnglish ||
        question.type == QuestionType.sentenceHarakat;
    final isAnswerArabic = question.type == QuestionType.englishToArabic ||
        question.type == QuestionType.sentenceHarakat;

    final (String typeBadge, Color typeColor) = switch (question.type) {
      QuestionType.englishToArabic => ('English → Arabic', theme.colorScheme.primary),
      QuestionType.arabicToEnglish => ('Arabic → English', theme.colorScheme.secondary),
      QuestionType.sentenceHarakat => ('Add Ḥarakāt & Translate', theme.colorScheme.tertiary),
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (_currentIndex + 1) / total,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),

          // Progress label
          Text(
            'Question ${_currentIndex + 1} of $total  |  Score: $_score',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),

          // Type badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              typeBadge,
              style: TextStyle(
                color: typeColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Prompt card
          Card(
            elevation: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Text(
                  question.prompt,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isArabicPrompt ? 32 : 24,
                  ),
                  textAlign: TextAlign.center,
                  textDirection:
                      isArabicPrompt ? TextDirection.rtl : TextDirection.ltr,
                ),
                if (question.type == QuestionType.sentenceHarakat) ...[
                  const SizedBox(height: 8),
                  Text(
                    '(Add ḥarakāt to the sentence above and translate it)',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ]),
            ),
          ),
          const SizedBox(height: 20),

          // Keyboard / Draw toggle buttons
          if (!_showResult)
            Row(children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _showCanvas = false),
                  style: !_showCanvas
                      ? OutlinedButton.styleFrom(
                          backgroundColor:
                              theme.colorScheme.primaryContainer)
                      : null,
                  child: const Text('⌨️ Keyboard'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _showCanvas = !_showCanvas),
                  style: _showCanvas
                      ? OutlinedButton.styleFrom(
                          backgroundColor:
                              theme.colorScheme.primaryContainer)
                      : null,
                  child: const Text('✏️ Draw'),
                ),
              ),
            ]),

          if (!_showResult) const SizedBox(height: 12),

          // Main answer field
          TextField(
            controller: _answerController,
            onChanged: (v) => setState(() => _userAnswer = v),
            enabled: !_showResult,
            textDirection:
                isAnswerArabic ? TextDirection.rtl : TextDirection.ltr,
            style: TextStyle(fontSize: isAnswerArabic ? 22 : 18),
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              labelText: question.type == QuestionType.sentenceHarakat
                  ? 'Write sentence with ḥarakāt'
                  : isAnswerArabic
                      ? 'اكتب إجابتك هنا - Type your answer'
                      : 'Type your answer here',
              border: const OutlineInputBorder(),
            ),
          ),

          // Translation field (sentence questions only)
          if (question.type == QuestionType.sentenceHarakat) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _translationController,
              onChanged: (v) => setState(() => _translationAnswer = v),
              enabled: !_showResult,
              style: const TextStyle(fontSize: 18),
              maxLines: 3,
              minLines: 1,
              decoration: const InputDecoration(
                labelText: 'English translation',
                border: OutlineInputBorder(),
              ),
            ),
          ],

          // Drawing scratch pad
          if (!_showResult && _showCanvas) ...[
            const SizedBox(height: 12),
            const DrawingCanvas(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'Use the scratch pad to practice. Type your final answer in the field above.',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Submit / Next button
          if (!_showResult)
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton.icon(
                onPressed: _userAnswer.trim().isEmpty ? null : _submitAnswer,
                icon: const Icon(Icons.check),
                label: const Text(
                  'Submit Answer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          else ...[
            _buildResultCard(context, question),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: _nextQuestion,
                style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary),
                child: Text(
                  _currentIndex + 1 >= _questions.length
                      ? 'See Results 🏆'
                      : 'Next Question →',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ── RESULT CARDS ──────────────────────────────────────────────────────────

  Widget _buildResultCard(BuildContext context, QuizQuestion question) {
    final fullyCorrect = question.type == QuestionType.sentenceHarakat
        ? _isCorrect && _translationCorrect
        : _isCorrect;

    return Card(
      color: fullyCorrect ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: question.type == QuestionType.sentenceHarakat
            ? _buildSentenceResult(question)
            : _buildVocabResult(question),
      ),
    );
  }

  Widget _buildSentenceResult(QuizQuestion question) {
    final statusText = _isCorrect && _translationCorrect
        ? '✅ Both Correct! Well done!'
        : _isCorrect
            ? '⚠️ Ḥarakāt correct, but translation is wrong'
            : _translationCorrect
                ? '⚠️ Translation correct, but ḥarakāt are wrong'
                : '❌ Both incorrect';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(statusText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),

        const Text('Your ḥarakāt:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          _userAnswer.isEmpty ? '(empty)' : _userAnswer,
          style: TextStyle(
            fontSize: 20,
            color: _isCorrect ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 4),

        const Text('Correct ḥarakāt:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          question.correctAnswer,
          style: const TextStyle(fontSize: 22, color: Color(0xFF1565C0)),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 12),

        const Text('Your translation:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          _translationAnswer.isEmpty ? '(empty)' : _translationAnswer,
          style: TextStyle(
            fontSize: 16,
            color: _translationCorrect
                ? const Color(0xFF2E7D32)
                : const Color(0xFFC62828),
          ),
        ),
        const SizedBox(height: 4),

        const Text('Correct translation:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          question.sentenceData?.english ?? '',
          style: const TextStyle(fontSize: 16, color: Color(0xFF1565C0)),
        ),
      ],
    );
  }

  Widget _buildVocabResult(QuizQuestion question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isCorrect ? '✅ Correct! 🎉' : '❌ Incorrect',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _isCorrect ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
          ),
        ),
        const SizedBox(height: 12),
        if (!_isCorrect) ...[
          const Text('Your answer:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            _userAnswer,
            style: const TextStyle(fontSize: 20, color: Color(0xFFC62828)),
          ),
          const SizedBox(height: 8),
        ],
        const Text('Correct answer:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          question.correctAnswer,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
          textDirection: question.type == QuestionType.englishToArabic
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
      ],
    );
  }
}