class AppText {
  final bool english;
  const AppText(this.english);

  String get greeting => english ? 'Hello!' : 'Xin chào!';
  String get subtitle =>
      english ? 'What to learn today?' : 'Hôm nay học gì nào?';
  String get totalWords => english ? 'Vocabulary' : 'Từ vựng';
  String get saved => english ? 'Saved' : 'Đã lưu';
  String get quickLearn => english ? 'Quick Study' : 'Học tập nhanh';
  String get flashcard => english ? 'Flashcard' : 'Lật thẻ Flashcard';
  String get quiz => english ? 'Quiz' : 'Trắc nghiệm Quiz';
  String get savedList => english ? 'Saved Words' : 'Từ đã đánh dấu';
  String get back => english ? 'Back' : 'Quay lại';
  String get chooseTopicFlashcard =>
      english ? 'Choose Flashcard Topic' : 'Chọn chủ đề Lật thẻ';
  String get chooseTopicQuiz =>
      english ? 'Choose Quiz Topic' : 'Chọn chủ đề Quiz';
  String get savedTitle =>
      english ? 'Saved flashcards:' : 'Danh sách các từ đã đánh dấu:';
  String get noSaved =>
      english ? 'No saved flashcards' : 'Chưa có flashcard nào được lưu';
  String get result => english ? 'Result' : 'Kết quả';
  String get retry => english ? 'Retry' : 'Làm lại';
  String get next => english ? 'Next →' : 'Câu tiếp theo →';
  String get seeResult => english ? 'See Result' : 'Xem kết quả';
  String get excellent => english ? 'Excellent!' : 'Xuất sắc!';
  String get good => english ? 'Good job!' : 'Khá tốt!';
  String get average => english ? 'Average!' : 'Trung bình!';
  String get question => english ? 'Question' : 'Câu hỏi';
  String get score => english ? 'Score' : 'Điểm';
  String get correct => english ? 'correct' : 'câu đúng';
  String get topic => english ? 'Topic: ' : 'Chủ đề: ';
  String get navHome => english ? 'Home' : 'Trang chủ';
  String get navStudy => english ? 'Study' : 'Học tập';
  String get navAbout => english ? 'About' : 'Thông tin';
  String get navSettings => english ? 'Settings' : 'Cài đặt';
  String questionText(String word) =>
      english ? 'What does "$word" mean?' : '"$word" nghĩa là gì?';
  String resultText(int diem, int total) =>
      english ? '$diem / $total correct' : '$diem / $total câu đúng';
  String get settingsTitle =>
      english ? 'App Settings' : 'Cấu hình ứng dụng';
  String get settingNotif => english ? 'Notifications' : 'Thông báo';
  String get settingLang =>
      english ? 'Language: English' : 'Ngôn ngữ: Tiếng Anh';
  String get settingDark => english ? 'Dark Mode' : 'Chế độ: Dark Mode';
  String get settingVersion =>
      english ? 'App Version' : 'Phiên bản ứng dụng';
}
