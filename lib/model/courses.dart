class Course {
  String imgPath;
  String course;
  String length;
  Course(this.imgPath, this.course, this.length);
  static List<Course> generateCourse() {
    return [
      Course('assets/images/physics.png', 'Physics', '2h 32m'),
      Course('assets/images/chemistry.png', 'Chemistry', '3h 20min'),
      Course('assets/images/chemistry.png', 'Chemistry', 'Total Length'),
      Course('assets/images/chemistry.png', 'Chemistry', 'Total Length'),
    ];
  }
}
