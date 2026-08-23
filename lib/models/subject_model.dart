class Subject {
  String id;
  String name;
  String description;
  double progress;
  int totalChapters;
  int completedChapters;
  int xpEarned;
  int studyTimeMinutes;

  Subject({
    required this.id,
    required this.name,
    this.description = '',
    this.progress = 0.0,
    this.totalChapters = 10,
    this.completedChapters = 0,
    this.xpEarned = 0,
    this.studyTimeMinutes = 0,
  });
}

class StudySession {
  DateTime date;
  int durationMinutes;
  int xpEarned;
  int questionsSolved;
  double accuracy;

  StudySession({
    required this.date,
    this.durationMinutes = 0,
    this.xpEarned = 0,
    this.questionsSolved = 0,
    this.accuracy = 0.0,
  });
}