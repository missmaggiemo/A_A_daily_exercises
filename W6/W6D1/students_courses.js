function Student(firstName, lastName) {
  this.name = firstName + " " + lastName;
  this.courses = [];
}



Student.prototype.enroll = function(course) {
  if (this.courses.indexOf(course) == -1){
    this.courses.push(course);
    course.addStudent(this);
  }
}

function Course(courseName, department, credits){
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

Course.prototype.addStudent = function(student){
  if (this.students.indexOf(student) == -1){
   this.students.push(student);
   student.enroll(this);
  }
}


