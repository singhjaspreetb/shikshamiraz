class Courses {
  String imgPath;
  String course;
  String length;
  Courses(this.imgPath, this.course, this.length);
  static List<Courses> generateCourse() {
    return [
      Courses('assets/images/lawsofmotion.png', 'Laws of Motion', '2h 32m'),
      Courses('assets/images/lawsofmotion.png', 'Laws of Motion', '3h 20min'),
      Courses(
          'assets/images/lawsofmotion.png', 'Laws of Motion', 'Total Length'),
      Courses(
          'assets/images/lawsofmotion.png', 'Laws of Motion', 'Total Length'),
    ];
  }
}
