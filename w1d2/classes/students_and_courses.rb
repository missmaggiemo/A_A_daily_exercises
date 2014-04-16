class Student
  attr_accessor :first_name, :last_name, :courses, :course_load

  def initialize( first_name, last_name )
    @first_name = first_name
    @last_name = last_name
    @courses = []
    @course_load = {}
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    unless @courses.include?(course)
      @courses << course
      course.add_student(self)
      add_course_load(course)
    end
  end

  # this is problematic because you don't want to call other classes' methods in your own class!

  private

  def add_course_load(course)
    if @course_load[course.department]
      @course_load[course.department] += course.credits
    else
      @course_load[course.department] = course.credits
    end
  end

end


class Course
  attr_accessor :course_name, :department, :credits, :students

  def initialize( course_name, department, credits )
    @students = []
    @course_name = course_name
    @department = department
    @credits = credits
  end

  # this is problematic because you don't want to call other classes' methods in your own class!

  def add_student(student)
    unless @students.include?(student)
      @students << student
      student.enroll(self)
    end
  end

end