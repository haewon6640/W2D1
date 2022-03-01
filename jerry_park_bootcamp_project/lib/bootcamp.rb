class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = Array.new(0)
    @students = Array.new(0)
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  attr_reader :name, :slogan, :teachers, :students

  def hire(str)
    @teachers << str
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    end
    false
  end

  def enrolled?(str)
    @students.include? str
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if @students.include? student
      @grades[student] << grade
      true
    else
      false
    end
  end

  def num_grades(student)
    return @grades[student].length if @students.include?(student)

    0
  end

  def average_grade(student)
    return @grades[student].sum / @grades[student].length if @students.include?(student) && @grades[student].length > 0
    nil
  end
end
