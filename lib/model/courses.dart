class Course {
  String imgPath;
  String course;
  String length;
  Course(this.imgPath, this.course, this.length);
  static List<Course> generateCourse() {
    return [
      Course('assets/images/physics.png', 'Physics', 'Total Length'),
      Course('assets/images/chemistry.png', 'Chemistry', 'Total Length'),
    ];
  }
}
