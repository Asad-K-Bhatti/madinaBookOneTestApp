enum QuestionType { englishToArabic, arabicToEnglish, sentenceHarakat }

class VocabWord {
  final String arabic, arabicWithHarakat, english;
  final int chapter;
  const VocabWord(this.arabic, this.arabicWithHarakat, this.english, this.chapter);
}

class ArabicSentence {
  final String withHarakat, withoutHarakat, english;
  final int chapter;
  const ArabicSentence(this.withHarakat, this.withoutHarakat, this.english, this.chapter);
}

class QuizQuestion {
  final QuestionType type;
  final String prompt, correctAnswer;
  final List<String> alternateAnswers;
  final ArabicSentence? sentenceData;
  const QuizQuestion({
    required this.type, required this.prompt, required this.correctAnswer,
    this.alternateAnswers = const [], this.sentenceData,
  });
}