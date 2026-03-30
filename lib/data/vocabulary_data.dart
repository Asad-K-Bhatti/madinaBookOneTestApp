// lib/data/vocabulary_data.dart

import '../models/models.dart';

class VocabularyData {
  static const int maxChapter = 23;

  static List<VocabWord> getVocabUpToChapter(int chapter) =>
      allVocab.where((w) => w.chapter <= chapter).toList();

  static List<ArabicSentence> getSentencesUpToChapter(int chapter) =>
      allSentences.where((s) => s.chapter <= chapter).toList();

  static const List<VocabWord> allVocab = [
    // ===== CHAPTER 1 =====
    VocabWord('كتاب', 'كِتَابٌ', 'book', 1),
    VocabWord('قلم', 'قَلَمٌ', 'pen', 1),
    VocabWord('مفتاح', 'مِفْتَاحٌ', 'key', 1),
    VocabWord('باب', 'بَابٌ', 'door', 1),
    VocabWord('بيت', 'بَيْتٌ', 'house', 1),
    VocabWord('مسجد', 'مَسْجِدٌ', 'mosque', 1),
    VocabWord('هذا', 'هَذَا', 'this (masculine)', 1),
    VocabWord('ذلك', 'ذَلِكَ', 'that (masculine)', 1),
    VocabWord('ما', 'مَا', 'what', 1),
    VocabWord('من', 'مَنْ', 'who', 1),
    VocabWord('نعم', 'نَعَمْ', 'yes', 1),
    VocabWord('لا', 'لَا', 'no', 1),
    VocabWord('اسم', 'اِسْمٌ', 'name / noun', 1),
    VocabWord('طالب', 'طَالِبٌ', 'student', 1),
    VocabWord('مدرس', 'مُدَرِّسٌ', 'teacher', 1),
    VocabWord('كرسي', 'كُرْسِيٌّ', 'chair', 1),
    VocabWord('نجم', 'نَجْمٌ', 'star', 1),
    VocabWord('حجر', 'حَجَرٌ', 'stone', 1),
    VocabWord('سرير', 'سَرِيرٌ', 'bed', 1),

    // ===== CHAPTER 2 =====
    VocabWord('ال', 'الـ', 'the (definite article)', 2),
    VocabWord('تاجر', 'تَاجِرٌ', 'merchant', 2),
    VocabWord('ولد', 'وَلَدٌ', 'boy', 2),
    VocabWord('رجل', 'رَجُلٌ', 'man', 2),
    VocabWord('طبيب', 'طَبِيبٌ', 'doctor', 2),
    VocabWord('امام', 'إِمَامٌ', 'imam / leader', 2),
    VocabWord('منديل', 'مِنْدِيلٌ', 'handkerchief', 2),
    VocabWord('حمار', 'حِمَارٌ', 'donkey', 2),
    VocabWord('جديد', 'جَدِيدٌ', 'new', 2),
    VocabWord('قديم', 'قَدِيمٌ', 'old (thing)', 2),
    VocabWord('كبير', 'كَبِيرٌ', 'big', 2),
    VocabWord('صغير', 'صَغِيرٌ', 'small', 2),
    VocabWord('جميل', 'جَمِيلٌ', 'beautiful', 2),
    VocabWord('مكسور', 'مَكْسُورٌ', 'broken', 2),
    VocabWord('مفتوح', 'مَفْتُوحٌ', 'open', 2),
    VocabWord('قميص', 'قَمِيصٌ', 'shirt', 2),
    VocabWord('ديك', 'دِيكٌ', 'rooster', 2),
    VocabWord('كلب', 'كَلْبٌ', 'dog', 2),
    VocabWord('قطة', 'قِطَّةٌ', 'cat', 2),

    // ===== CHAPTER 3 =====
    VocabWord('في', 'فِي', 'in', 3),
    VocabWord('على', 'عَلَى', 'on / upon', 3),
    VocabWord('اين', 'أَيْنَ', 'where', 3),
    VocabWord('غرفة', 'غُرْفَةٌ', 'room', 3),
    VocabWord('حقيبة', 'حَقِيبَةٌ', 'bag', 3),
    VocabWord('مكتب', 'مَكْتَبٌ', 'desk / office', 3),
    VocabWord('فصل', 'فَصْلٌ', 'classroom', 3),
    VocabWord('سيارة', 'سَيَّارَةٌ', 'car', 3),
    VocabWord('تحت', 'تَحْتَ', 'under', 3),
    VocabWord('فوق', 'فَوْقَ', 'above', 3),
    VocabWord('امام', 'أَمَامَ', 'in front of', 3),
    VocabWord('مسطرة', 'مِسْطَرَةٌ', 'ruler', 3),
    VocabWord('ساعة', 'سَاعَةٌ', 'watch / clock / hour', 3),
    VocabWord('ثلاجة', 'ثَلَّاجَةٌ', 'refrigerator', 3),
    VocabWord('درج', 'دُرْجٌ', 'drawer', 3),
    VocabWord('صورة', 'صُورَةٌ', 'picture', 3),
    VocabWord('سبورة', 'سَبُّورَةٌ', 'blackboard', 3),
    VocabWord('جدار', 'جِدَارٌ', 'wall', 3),

    // ===== CHAPTER 4 =====
    VocabWord('هو', 'هُوَ', 'he', 4),
    VocabWord('هي', 'هِيَ', 'she', 4),
    VocabWord('هذه', 'هَذِهِ', 'this (feminine)', 4),
    VocabWord('تلك', 'تِلْكَ', 'that (feminine)', 4),
    VocabWord('طويل', 'طَوِيلٌ', 'tall / long', 4),
    VocabWord('قصير', 'قَصِيرٌ', 'short', 4),
    VocabWord('نظيف', 'نَظِيفٌ', 'clean', 4),
    VocabWord('وسخ', 'وَسِخٌ', 'dirty', 4),
    VocabWord('حار', 'حَارٌّ', 'hot', 4),
    VocabWord('بارد', 'بَارِدٌ', 'cold', 4),
    VocabWord('ماء', 'مَاءٌ', 'water', 4),
    VocabWord('لبن', 'لَبَنٌ', 'milk', 4),
    VocabWord('شاي', 'شَايٌ', 'tea', 4),
    VocabWord('سكر', 'سُكَّرٌ', 'sugar', 4),
    VocabWord('طعام', 'طَعَامٌ', 'food', 4),
    VocabWord('بنت', 'بِنْتٌ', 'girl / daughter', 4),
    VocabWord('امراة', 'اِمْرَأَةٌ', 'woman', 4),
    VocabWord('مدرسة', 'مُدَرِّسَةٌ', 'teacher (female)', 4),
    VocabWord('طالبة', 'طَالِبَةٌ', 'student (female)', 4),

    // ===== CHAPTER 5 =====
    VocabWord('ذاهب', 'ذَاهِبٌ', 'going', 5),
    VocabWord('جالس', 'جَالِسٌ', 'sitting', 5),
    VocabWord('واقف', 'وَاقِفٌ', 'standing', 5),
    VocabWord('نائم', 'نَائِمٌ', 'sleeping', 5),
    VocabWord('الى', 'إِلَى', 'to / towards', 5),
    VocabWord('من', 'مِنْ', 'from', 5),
    VocabWord('هنا', 'هُنَا', 'here', 5),
    VocabWord('هناك', 'هُنَاكَ', 'there', 5),
    VocabWord('مستشفى', 'مُسْتَشْفَى', 'hospital', 5),
    VocabWord('سوق', 'سُوقٌ', 'market / bazaar', 5),
    VocabWord('مطبخ', 'مَطْبَخٌ', 'kitchen', 5),
    VocabWord('حديقة', 'حَدِيقَةٌ', 'garden', 5),
    VocabWord('مدرسة', 'مَدْرَسَةٌ', 'school', 5),
    VocabWord('أب', 'أَبٌ', 'father', 5),
    VocabWord('أم', 'أُمٌّ', 'mother', 5),
    VocabWord('ابن', 'اِبْنٌ', 'son', 5),

    // ===== CHAPTER 6 =====
    VocabWord('انا', 'أَنَا', 'I', 6),
    VocabWord('انت', 'أَنْتَ', 'you (masculine)', 6),
    VocabWord('انتِ', 'أَنْتِ', 'you (feminine)', 6),
    VocabWord('مسلم', 'مُسْلِمٌ', 'Muslim (male)', 6),
    VocabWord('مسلمة', 'مُسْلِمَةٌ', 'Muslim (female)', 6),
    VocabWord('عربي', 'عَرَبِيٌّ', 'Arab / Arabic', 6),
    VocabWord('كيف', 'كَيْفَ', 'how', 6),
    VocabWord('حال', 'حَالٌ', 'condition / state', 6),
    VocabWord('الحمد لله', 'الْحَمْدُ لِلَّهِ', 'praise be to Allah', 6),
    VocabWord('بخير', 'بِخَيْرٍ', 'fine / well', 6),
    VocabWord('اهلا', 'أَهْلاً', 'welcome / hello', 6),
    VocabWord('مرحبا', 'مَرْحَباً', 'hello / greetings', 6),

    // ===== CHAPTER 7 =====
    VocabWord('ل', 'لِ', 'for / belonging to', 7),
    VocabWord('لي', 'لِي', 'I have / for me', 7),
    VocabWord('له', 'لَهُ', 'he has / for him', 7),
    VocabWord('لها', 'لَهَا', 'she has / for her', 7),
    VocabWord('دكان', 'دُكَّانٌ', 'shop / store', 7),
    VocabWord('جار', 'جَارٌ', 'neighbor', 7),
    VocabWord('صديق', 'صَدِيقٌ', 'friend', 7),
    VocabWord('اخ', 'أَخٌ', 'brother', 7),
    VocabWord('اخت', 'أُخْتٌ', 'sister', 7),
    VocabWord('زوج', 'زَوْجٌ', 'husband', 7),
    VocabWord('زوجة', 'زَوْجَةٌ', 'wife', 7),

    // ===== CHAPTER 8 =====
    VocabWord('ذهب', 'ذَهَبَ', 'he went', 8),
    VocabWord('جاء', 'جَاءَ', 'he came', 8),
    VocabWord('جلس', 'جَلَسَ', 'he sat', 8),
    VocabWord('وقف', 'وَقَفَ', 'he stood', 8),
    VocabWord('فتح', 'فَتَحَ', 'he opened', 8),
    VocabWord('كتب', 'كَتَبَ', 'he wrote', 8),
    VocabWord('قرا', 'قَرَأَ', 'he read', 8),
    VocabWord('اكل', 'أَكَلَ', 'he ate', 8),
    VocabWord('شرب', 'شَرِبَ', 'he drank', 8),
    VocabWord('نام', 'نَامَ', 'he slept', 8),
    VocabWord('خرج', 'خَرَجَ', 'he went out', 8),
    VocabWord('دخل', 'دَخَلَ', 'he entered', 8),
    VocabWord('درس', 'دَرَسَ', 'he studied', 8),
    VocabWord('سمع', 'سَمِعَ', 'he heard', 8),

    // ===== CHAPTER 9 =====
    VocabWord('ذهبت', 'ذَهَبْتُ', 'I went', 9),
    VocabWord('جامعة', 'جَامِعَةٌ', 'university', 9),
    VocabWord('مكتبة', 'مَكْتَبَةٌ', 'library', 9),
    VocabWord('مطعم', 'مَطْعَمٌ', 'restaurant', 9),
    VocabWord('سال', 'سَأَلَ', 'he asked', 9),
    VocabWord('اجاب', 'أَجَابَ', 'he answered', 9),
    VocabWord('فهم', 'فَهِمَ', 'he understood', 9),

    // ===== CHAPTER 10 =====
    VocabWord('اذان', 'أَذَانٌ', 'call to prayer', 10),
    VocabWord('صلاة', 'صَلَاةٌ', 'prayer', 10),
    VocabWord('توضا', 'تَوَضَّأَ', 'he made ablution', 10),
    VocabWord('صلى', 'صَلَّى', 'he prayed', 10),
    VocabWord('فجر', 'فَجْرٌ', 'dawn / Fajr', 10),
    VocabWord('ظهر', 'ظُهْرٌ', 'noon / Dhuhr', 10),
    VocabWord('عصر', 'عَصْرٌ', 'afternoon / Asr', 10),
    VocabWord('مغرب', 'مَغْرِبٌ', 'sunset / Maghrib', 10),
    VocabWord('عشاء', 'عِشَاءٌ', 'night / Isha', 10),
    VocabWord('و', 'وَ', 'and', 10),
    VocabWord('ثم', 'ثُمَّ', 'then / after that', 10),

    // ===== CHAPTER 11 =====
    VocabWord('مع', 'مَعَ', 'with', 11),
    VocabWord('قبل', 'قَبْلَ', 'before', 11),
    VocabWord('بعد', 'بَعْدَ', 'after', 11),
    VocabWord('لماذا', 'لِمَاذَا', 'why', 11),
    VocabWord('لان', 'لِأَنَّ', 'because', 11),
    VocabWord('رجع', 'رَجَعَ', 'he returned', 11),
    VocabWord('صعب', 'صَعْبٌ', 'difficult', 11),
    VocabWord('سهل', 'سَهْلٌ', 'easy', 11),
    VocabWord('درس', 'دَرْسٌ', 'lesson', 11),

    // ===== CHAPTER 12 =====
    VocabWord('كل', 'كُلٌّ', 'every / all', 12),
    VocabWord('بعض', 'بَعْضٌ', 'some', 12),
    VocabWord('كثير', 'كَثِيرٌ', 'many / a lot', 12),
    VocabWord('قليل', 'قَلِيلٌ', 'few / little', 12),
    VocabWord('مريض', 'مَرِيضٌ', 'sick / ill', 12),
    VocabWord('صحيح', 'صَحِيحٌ', 'correct / healthy', 12),
    VocabWord('طلاب', 'طُلَّابٌ', 'students (plural)', 12),
    VocabWord('كتب', 'كُتُبٌ', 'books (plural)', 12),

    // ===== CHAPTER 13 =====
    VocabWord('كم', 'كَمْ', 'how many / how much', 13),
    VocabWord('واحد', 'وَاحِدٌ', 'one', 13),
    VocabWord('اثنان', 'اِثْنَانِ', 'two', 13),
    VocabWord('ثلاثة', 'ثَلَاثَةٌ', 'three', 13),
    VocabWord('اربعة', 'أَرْبَعَةٌ', 'four', 13),
    VocabWord('خمسة', 'خَمْسَةٌ', 'five', 13),
    VocabWord('ستة', 'سِتَّةٌ', 'six', 13),
    VocabWord('سبعة', 'سَبْعَةٌ', 'seven', 13),
    VocabWord('ثمانية', 'ثَمَانِيَةٌ', 'eight', 13),
    VocabWord('تسعة', 'تِسْعَةٌ', 'nine', 13),
    VocabWord('عشرة', 'عَشَرَةٌ', 'ten', 13),

    // ===== CHAPTER 14 =====
    VocabWord('هل', 'هَلْ', 'is / are (question)', 14),
    VocabWord('مدير', 'مُدِيرٌ', 'director / manager', 14),
    VocabWord('موظف', 'مُوَظَّفٌ', 'employee', 14),
    VocabWord('مهندس', 'مُهَنْدِسٌ', 'engineer', 14),
    VocabWord('محامي', 'مُحَامٍ', 'lawyer', 14),
    VocabWord('ضابط', 'ضَابِطٌ', 'officer', 14),

    // ===== CHAPTER 15 =====
    VocabWord('دقيقة', 'دَقِيقَةٌ', 'minute', 15),
    VocabWord('الان', 'الآنَ', 'now', 15),
    VocabWord('صباح', 'صَبَاحٌ', 'morning', 15),
    VocabWord('مساء', 'مَسَاءٌ', 'evening', 15),
    VocabWord('ليل', 'لَيْلٌ', 'night', 15),
    VocabWord('نهار', 'نَهَارٌ', 'day (daytime)', 15),
    VocabWord('نصف', 'نِصْفٌ', 'half', 15),
    VocabWord('ربع', 'رُبْعٌ', 'quarter', 15),

    // ===== CHAPTER 16 =====
    VocabWord('يوم', 'يَوْمٌ', 'day', 16),
    VocabWord('امس', 'أَمْسِ', 'yesterday', 16),
    VocabWord('اليوم', 'الْيَوْمَ', 'today', 16),
    VocabWord('غدا', 'غَداً', 'tomorrow', 16),
    VocabWord('اسبوع', 'أُسْبُوعٌ', 'week', 16),
    VocabWord('شهر', 'شَهْرٌ', 'month', 16),
    VocabWord('سنة', 'سَنَةٌ', 'year', 16),
    VocabWord('الاحد', 'الأَحَدُ', 'Sunday', 16),
    VocabWord('الاثنين', 'الاِثْنَيْنِ', 'Monday', 16),
    VocabWord('الثلاثاء', 'الثُّلَاثَاءُ', 'Tuesday', 16),
    VocabWord('الاربعاء', 'الأَرْبِعَاءُ', 'Wednesday', 16),
    VocabWord('الخميس', 'الخَمِيسُ', 'Thursday', 16),
    VocabWord('الجمعة', 'الجُمُعَةُ', 'Friday', 16),
    VocabWord('السبت', 'السَّبْتُ', 'Saturday', 16),

    // ===== CHAPTER 17 =====
    VocabWord('هؤلاء', 'هَؤُلَاءِ', 'these (plural)', 17),
    VocabWord('اولئك', 'أُولَئِكَ', 'those (plural)', 17),
    VocabWord('رجال', 'رِجَالٌ', 'men (plural)', 17),
    VocabWord('اولاد', 'أَوْلَادٌ', 'boys / children (plural)', 17),
    VocabWord('بنات', 'بَنَاتٌ', 'girls (plural)', 17),
    VocabWord('مساجد', 'مَسَاجِدُ', 'mosques (plural)', 17),

    // ===== CHAPTER 18 =====
    VocabWord('يذهب', 'يَذْهَبُ', 'he goes', 18),
    VocabWord('يجيء', 'يَجِيءُ', 'he comes', 18),
    VocabWord('يجلس', 'يَجْلِسُ', 'he sits', 18),
    VocabWord('يقرا', 'يَقْرَأُ', 'he reads', 18),
    VocabWord('يكتب', 'يَكْتُبُ', 'he writes', 18),
    VocabWord('ياكل', 'يَأْكُلُ', 'he eats', 18),
    VocabWord('يفهم', 'يَفْهَمُ', 'he understands', 18),
    VocabWord('يسال', 'يَسْأَلُ', 'he asks', 18),
    VocabWord('يعمل', 'يَعْمَلُ', 'he works', 18),
    VocabWord('يعلم', 'يَعْلَمُ', 'he knows', 18),

    // ===== CHAPTER 19 =====
    VocabWord('يحب', 'يُحِبُّ', 'he loves / likes', 19),
    VocabWord('يريد', 'يُرِيدُ', 'he wants', 19),
    VocabWord('عند', 'عِنْدَ', 'at / have', 19),
    VocabWord('يلعب', 'يَلْعَبُ', 'he plays', 19),
    VocabWord('ينظر', 'يَنْظُرُ', 'he looks', 19),
    VocabWord('يسمع', 'يَسْمَعُ', 'he hears / listens', 19),
    VocabWord('يتكلم', 'يَتَكَلَّمُ', 'he speaks', 19),
    VocabWord('يدرس', 'يَدْرُسُ', 'he studies', 19),
    VocabWord('يعرف', 'يَعْرِفُ', 'he knows (someone)', 19),
    VocabWord('لعب', 'لَعِبَ', 'he played', 19),
    VocabWord('نظر', 'نَظَرَ', 'he looked', 19),

    // ===== CHAPTER 20 =====
    VocabWord('فعل امر', 'فِعْلُ أَمْرٍ', 'imperative verb', 20),
    VocabWord('اذهب', 'اِذْهَبْ', 'go! (command)', 20),
    VocabWord('اجلس', 'اِجْلِسْ', 'sit! (command)', 20),
    VocabWord('اخرج', 'اُخْرُجْ', 'go out! (command)', 20),
    VocabWord('ادخل', 'اُدْخُلْ', 'enter! (command)', 20),
    VocabWord('افتح', 'اِفْتَحْ', 'open! (command)', 20),
    VocabWord('اكتب', 'اُكْتُبْ', 'write! (command)', 20),
    VocabWord('اقرا', 'اِقْرَأْ', 'read! (command)', 20),
    VocabWord('اغسل', 'اِغْسِلْ', 'wash! (command)', 20),
    VocabWord('كل', 'كُلْ', 'eat! (command)', 20),
    VocabWord('اشرب', 'اِشْرَبْ', 'drink! (command)', 20),

    // ===== CHAPTER 21 =====
    VocabWord('الذي', 'الَّذِي', 'who / which (masculine)', 21),
    VocabWord('التي', 'الَّتِي', 'who / which (feminine)', 21),
    VocabWord('الذين', 'الَّذِينَ', 'who / which (masculine plural)', 21),
    VocabWord('مجتهد', 'مُجْتَهِدٌ', 'hardworking / diligent', 21),
    VocabWord('كسلان', 'كَسْلَانٌ', 'lazy', 21),
    VocabWord('غائب', 'غَائِبٌ', 'absent', 21),
    VocabWord('حاضر', 'حَاضِرٌ', 'present / attending', 21),
    VocabWord('تقي', 'تَقِيٌّ', 'pious', 21),
    VocabWord('صالح', 'صَالِحٌ', 'righteous', 21),
    VocabWord('ناجح', 'نَاجِحٌ', 'successful', 21),
    VocabWord('راسب', 'رَاسِبٌ', 'failing (student)', 21),

    // ===== CHAPTER 22 =====
    VocabWord('نحن', 'نَحْنُ', 'we', 22),
    VocabWord('هم', 'هُمْ', 'they (masculine)', 22),
    VocabWord('انتم', 'أَنْتُمْ', 'you (masculine plural)', 22),
    VocabWord('ذهبنا', 'ذَهَبْنَا', 'we went', 22),
    VocabWord('ذهبوا', 'ذَهَبُوا', 'they went', 22),
    VocabWord('ذهبتم', 'ذَهَبْتُمْ', 'you (pl.) went', 22),
    VocabWord('خلق', 'خَلَقَ', 'he created', 22),
    VocabWord('سماء', 'سَمَاءٌ', 'sky / heaven', 22),
    VocabWord('ارض', 'أَرْضٌ', 'earth / land', 22),
    VocabWord('شمس', 'شَمْسٌ', 'sun', 22),
    VocabWord('قمر', 'قَمَرٌ', 'moon', 22),
    VocabWord('بحر', 'بَحْرٌ', 'sea', 22),
    VocabWord('نهر', 'نَهْرٌ', 'river', 22),
    VocabWord('جبل', 'جَبَلٌ', 'mountain', 22),

    // ===== CHAPTER 23 =====
    VocabWord('كان', 'كَانَ', 'he was', 23),
    VocabWord('يكون', 'يَكُونُ', 'he is (will be)', 23),
    VocabWord('اصبح', 'أَصْبَحَ', 'he became (morning)', 23),
    VocabWord('امتحان', 'اِمْتِحَانٌ', 'exam', 23),
    VocabWord('نتيجة', 'نَتِيجَةٌ', 'result', 23),
    VocabWord('ممتاز', 'مُمْتَازٌ', 'excellent', 23),
    VocabWord('جيد', 'جَيِّدٌ', 'good', 23),
    VocabWord('ضعف', 'ضُعْفٌ', 'weakness', 23),
    VocabWord('قوة', 'قُوَّةٌ', 'strength', 23),
    VocabWord('تاريخ', 'تَارِيخٌ', 'history / date', 23),
    VocabWord('جغرافيا', 'جُغْرَافِيَا', 'geography', 23),
    VocabWord('حساب', 'حِسَابٌ', 'arithmetic / account', 23),
    VocabWord('علم', 'عِلْمٌ', 'knowledge / science', 23),
  ];

  static const List<ArabicSentence> allSentences = [
    // Chapter 1
    ArabicSentence('هَذَا كِتَابٌ', 'هذا كتاب', 'This is a book.', 1),
    ArabicSentence('ذَلِكَ قَلَمٌ', 'ذلك قلم', 'That is a pen.', 1),
    ArabicSentence('مَا هَذَا؟ هَذَا مِفْتَاحٌ', 'ما هذا؟ هذا مفتاح', 'What is this? This is a key.', 1),
    ArabicSentence('مَنْ هَذَا؟ هَذَا طَالِبٌ', 'من هذا؟ هذا طالب', 'Who is this? This is a student.', 1),
    // Chapter 2
    ArabicSentence('الْكِتَابُ جَدِيدٌ', 'الكتاب جديد', 'The book is new.', 2),
    ArabicSentence('الْبَابُ مَفْتُوحٌ', 'الباب مفتوح', 'The door is open.', 2),
    ArabicSentence('الْقَلَمُ مَكْسُورٌ', 'القلم مكسور', 'The pen is broken.', 2),
    ArabicSentence('الْبَيْتُ كَبِيرٌ', 'البيت كبير', 'The house is big.', 2),
    // Chapter 3
    ArabicSentence('الْكِتَابُ عَلَى الْمَكْتَبِ', 'الكتاب على المكتب', 'The book is on the desk.', 3),
    ArabicSentence('الْقَلَمُ فِي الْحَقِيبَةِ', 'القلم في الحقيبة', 'The pen is in the bag.', 3),
    ArabicSentence('أَيْنَ الْمِفْتَاحُ؟', 'اين المفتاح؟', 'Where is the key?', 3),
    ArabicSentence('السَّيَّارَةُ أَمَامَ الْبَيْتِ', 'السيارة امام البيت', 'The car is in front of the house.', 3),
    // Chapter 4
    ArabicSentence('هَذِهِ طَالِبَةٌ', 'هذه طالبة', 'This is a (female) student.', 4),
    ArabicSentence('هِيَ مُدَرِّسَةٌ', 'هي مدرسة', 'She is a teacher.', 4),
    ArabicSentence('الْمَاءُ بَارِدٌ', 'الماء بارد', 'The water is cold.', 4),
    ArabicSentence('الشَّايُ حَارٌّ', 'الشاي حار', 'The tea is hot.', 4),
    // Chapter 5
    ArabicSentence('الطَّالِبُ ذَاهِبٌ إِلَى الْمَسْجِدِ', 'الطالب ذاهب الى المسجد', 'The student is going to the mosque.', 5),
    ArabicSentence('الطَّبِيبُ فِي الْمُسْتَشْفَى', 'الطبيب في المستشفى', 'The doctor is in the hospital.', 5),
    ArabicSentence('هُوَ جَالِسٌ هُنَا', 'هو جالس هنا', 'He is sitting here.', 5),
    ArabicSentence('الْأَبُ وَاقِفٌ', 'الاب واقف', 'The father is standing.', 5),
    // Chapter 6
    ArabicSentence('أَنَا مُسْلِمٌ', 'انا مسلم', 'I am a Muslim.', 6),
    ArabicSentence('أَنْتَ مِنْ أَيْنَ؟', 'انت من اين؟', 'Where are you from?', 6),
    ArabicSentence('كَيْفَ حَالُكَ؟ الْحَمْدُ لِلَّهِ', 'كيف حالك؟ الحمد لله', 'How are you? Praise be to Allah.', 6),
    // Chapter 7
    ArabicSentence('لِي كِتَابٌ جَدِيدٌ', 'لي كتاب جديد', 'I have a new book.', 7),
    ArabicSentence('لَهُ دُكَّانٌ فِي السُّوقِ', 'له دكان في السوق', 'He has a shop in the market.', 7),
    ArabicSentence('لَهَا بِنْتٌ جَمِيلَةٌ', 'لها بنت جميلة', 'She has a beautiful daughter.', 7),
    // Chapter 8
    ArabicSentence('ذَهَبَ الطَّالِبُ إِلَى الْمَسْجِدِ', 'ذهب الطالب الى المسجد', 'The student went to the mosque.', 8),
    ArabicSentence('فَتَحَ الْمُدَرِّسُ الْبَابَ', 'فتح المدرس الباب', 'The teacher opened the door.', 8),
    ArabicSentence('كَتَبَ الْوَلَدُ الدَّرْسَ', 'كتب الولد الدرس', 'The boy wrote the lesson.', 8),
    ArabicSentence('أَكَلَ الطَّعَامَ فِي الْمَطْبَخِ', 'اكل الطعام في المطبخ', 'He ate the food in the kitchen.', 8),
    // Chapter 9
    ArabicSentence('ذَهَبْتُ إِلَى الْجَامِعَةِ', 'ذهبت الى الجامعة', 'I went to the university.', 9),
    ArabicSentence('كَتَبْتُ الدَّرْسَ', 'كتبت الدرس', 'I wrote the lesson.', 9),
    ArabicSentence('سَأَلَ الطَّالِبُ الْمُدَرِّسَ', 'سال الطالب المدرس', 'The student asked the teacher.', 9),
    // Chapter 10
    ArabicSentence('سَمِعَ الطَّالِبُ الْأَذَانَ', 'سمع الطالب الاذان', 'The student heard the call to prayer.', 10),
    ArabicSentence('تَوَضَّأَ وَذَهَبَ إِلَى الْمَسْجِدِ', 'توضا وذهب الى المسجد', 'He made ablution and went to the mosque.', 10),
    ArabicSentence('جَاءَ الْمُدَرِّسُ وَجَلَسَ', 'جاء المدرس وجلس', 'The teacher came and sat.', 10),
    // Chapter 11
    ArabicSentence('ذَهَبَ إِلَى السُّوقِ مَعَ أَبِيهِ', 'ذهب الى السوق مع ابيه', 'He went to the market with his father.', 11),
    ArabicSentence('رَجَعَ مِنَ الْمَدْرَسَةِ قَبْلَ الظُّهْرِ', 'رجع من المدرسة قبل الظهر', 'He returned from school before noon.', 11),
    ArabicSentence('لِمَاذَا ذَهَبْتَ؟ لِأَنَّ الدَّرْسَ صَعْبٌ', 'لماذا ذهبت؟ لان الدرس صعب', 'Why did you go? Because the lesson is difficult.', 11),
    // Chapter 12
    ArabicSentence('كُلُّ طَالِبٍ مُجْتَهِدٌ', 'كل طالب مجتهد', 'Every student is hardworking.', 12),
    ArabicSentence('بَعْضُ الطُّلَّابِ مَرْضَى', 'بعض الطلاب مرضى', 'Some students are sick.', 12),
    ArabicSentence('هَذَا الْكِتَابُ سَهْلٌ وَذَلِكَ صَعْبٌ', 'هذا الكتاب سهل وذلك صعب', 'This book is easy and that is difficult.', 12),
    // Chapter 13
    ArabicSentence('كَمْ كِتَاباً عِنْدَكَ؟ عِنْدِي خَمْسَةُ كُتُبٍ', 'كم كتابا عندك؟ عندي خمسة كتب', 'How many books do you have? I have five books.', 13),
    // Chapter 14
    ArabicSentence('هَلْ أَنْتَ طَالِبٌ؟ نَعَمْ، أَنَا طَالِبٌ', 'هل انت طالب؟ نعم، انا طالب', 'Are you a student? Yes, I am a student.', 14),
    ArabicSentence('الْمُدِيرُ فِي الْمَكْتَبِ', 'المدير في المكتب', 'The director is in the office.', 14),
    // Chapter 15
    ArabicSentence('صَلَاةُ الْفَجْرِ فِي الصَّبَاحِ', 'صلاة الفجر في الصباح', 'The dawn prayer is in the morning.', 15),
    ArabicSentence('السَّاعَةُ الآنَ الثَّالِثَةُ وَالنِّصْفُ', 'الساعة الان الثالثة والنصف', 'The time now is three-thirty.', 15),
    // Chapter 16
    ArabicSentence('الْيَوْمُ يَوْمُ الْجُمُعَةِ', 'اليوم يوم الجمعة', 'Today is Friday.', 16),
    ArabicSentence('ذَهَبْتُ أَمْسِ إِلَى السُّوقِ', 'ذهبت امس الى السوق', 'I went to the market yesterday.', 16),
    // Chapter 17
    ArabicSentence('هَؤُلَاءِ طُلَّابٌ جُدُدٌ', 'هؤلاء طلاب جدد', 'These are new students.', 17),
    ArabicSentence('أُولَئِكَ تُجَّارٌ مِنَ الْيَابَانِ', 'اولئك تجار من اليابان', 'Those are merchants from Japan.', 17),
    // Chapter 18
    ArabicSentence('يَذْهَبُ الطَّالِبُ إِلَى الْجَامِعَةِ كُلَّ يَوْمٍ', 'يذهب الطالب الى الجامعة كل يوم', 'The student goes to the university every day.', 18),
    ArabicSentence('يَقْرَأُ الْقُرْآنَ بَعْدَ صَلَاةِ الْفَجْرِ', 'يقرا القران بعد صلاة الفجر', 'He reads the Quran after the dawn prayer.', 18),
    // Chapter 19
    ArabicSentence('يُحِبُّ الطَّالِبُ اللُّغَةَ الْعَرَبِيَّةَ', 'يحب الطالب اللغة العربية', 'The student loves the Arabic language.', 19),
    ArabicSentence('يُرِيدُ أَنْ يَدْرُسَ الطِّبَّ', 'يريد ان يدرس الطب', 'He wants to study medicine.', 19),
    // Chapter 20
    ArabicSentence('اِذْهَبْ إِلَى الْفَصْلِ', 'اذهب الى الفصل', 'Go to the classroom!', 20),
    ArabicSentence('اُكْتُبْ دَرْسَكَ', 'اكتب درسك', 'Write your lesson!', 20),
    // Chapter 21
    ArabicSentence('الطَّالِبُ الَّذِي ذَهَبَ مُجْتَهِدٌ', 'الطالب الذي ذهب مجتهد', 'The student who went is hardworking.', 21),
    ArabicSentence('الْمُدَرِّسَةُ الَّتِي جَاءَتْ لَطِيفَةٌ', 'المدرسة التي جاءت لطيفة', 'The teacher (f) who came is kind.', 21),
    // Chapter 22
    ArabicSentence('نَحْنُ ذَهَبْنَا إِلَى الْمَسْجِدِ', 'نحن ذهبنا الى المسجد', 'We went to the mosque.', 22),
    ArabicSentence('خَلَقَ اللَّهُ السَّمَاءَ وَالْأَرْضَ', 'خلق الله السماء والارض', 'Allah created the sky and the earth.', 22),
    // Chapter 23
    ArabicSentence('كَانَ الطَّالِبُ مُجْتَهِداً', 'كان الطالب مجتهدا', 'The student was hardworking.', 23),
    ArabicSentence('أَصْبَحَ الطَّبِيبُ مَشْهُوراً', 'اصبح الطبيب مشهورا', 'The doctor became famous.', 23),
  ];
}