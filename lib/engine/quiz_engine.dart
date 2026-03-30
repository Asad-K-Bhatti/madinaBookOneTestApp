import 'dart:math';
import '../models/models.dart';
import '../data/vocabulary_data.dart';

class QuizEngine {
  static List<QuizQuestion> generateQuiz(int maxChapter) {
    final vocab = VocabularyData.getVocabUpToChapter(maxChapter);
    final sentences = VocabularyData.getSentencesUpToChapter(maxChapter);
    final random = Random();
    final shuffledVocab = List<VocabWord>.from(vocab)..shuffle(random);
    final vocabCount = shuffledVocab.length < 35 ? shuffledVocab.length : 35;

    final vocabQuestions = <QuizQuestion>[];
    for (int i = 0; i < vocabCount; i++) {
      final word = shuffledVocab[i];
      if (random.nextBool()) {
        vocabQuestions.add(QuizQuestion(
          type: QuestionType.englishToArabic, prompt: word.english,
          correctAnswer: word.arabicWithHarakat,
          alternateAnswers: [word.arabic, word.arabicWithHarakat],
        ));
      } else {
        vocabQuestions.add(QuizQuestion(
          type: QuestionType.arabicToEnglish, prompt: word.arabicWithHarakat,
          correctAnswer: word.english, alternateAnswers: [word.english.toLowerCase()],
        ));
      }
    }

    final shuffledSentences = List<ArabicSentence>.from(sentences)..shuffle(random);
    final sentenceQuestions = shuffledSentences.take(5).map((s) => QuizQuestion(
      type: QuestionType.sentenceHarakat, prompt: s.withoutHarakat,
      correctAnswer: s.withHarakat, alternateAnswers: [s.english], sentenceData: s,
    )).toList();

    return [...vocabQuestions, ...sentenceQuestions];
  }

  static bool checkAnswer(QuizQuestion question, String userAnswer) {
    final user = _normalize(userAnswer.trim().toLowerCase());
    final correct = _normalize(question.correctAnswer.trim().toLowerCase());
    if (user == correct) return true;
    for (final alt in question.alternateAnswers) {
      if (user == _normalize(alt.trim().toLowerCase())) return true;
    }
    if (question.type == QuestionType.arabicToEnglish) {
      final userWords = user.split(RegExp(r'[ /,]+')).where((w) => w.length > 2);
      final correctWords = correct.split(RegExp(r'[ /,]+')).toSet();
      if (userWords.any(correctWords.contains)) return true;
    }
    return false;
  }

  static (bool, bool) checkSentenceHarakat(QuizQuestion q, String harakat, String translation) {
    final harakatOk = _normalize(harakat.trim()) == _normalize(q.correctAnswer.trim());
    bool transOk = false;
    if (q.sentenceData != null) {
      final t = translation.trim().toLowerCase().replaceAll(RegExp(r'[.?!]'), '');
      final e = q.sentenceData!.english.trim().toLowerCase().replaceAll(RegExp(r'[.?!]'), '');
      transOk = t == e || t.contains(e) || e.contains(t);
    }
    return (harakatOk, transOk);
  }

  static String _normalize(String text) => text
    .replaceAll('أ','ا').replaceAll('إ','ا').replaceAll('آ','ا').replaceAll('ٱ','ا')
    .replaceAll('ة','ه').replaceAll('ى','ي').replaceAll('ئ','ي').replaceAll('ؤ','و')
    .replaceAll('\u064B','').replaceAll('\u064C','').replaceAll('\u064D','')
    .replaceAll('\u064E','').replaceAll('\u064F','').replaceAll('\u0650','')
    .replaceAll('\u0651','').replaceAll('\u0652','').replaceAll(' ','');
}