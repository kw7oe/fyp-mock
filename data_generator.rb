require 'json'
require_relative 'student_generator'

module DataGenerator
  extend self

  def generate_students(id)
    students = 30.times.map { StudentGenerator.generate }
    {
      id: id,
      students: students
    }
  end

  def construct_course(id)
    {
      id: id,
      classes: groups(4, Date.new(2018, 3, 26), 3)
    }
  end

  def construct_attendance(course_id, date, group_id)
    attended, absent = student_ids(course_id, group_id).partition do |s|
      [true, false].sample
    end

    {
      course_id: course_id,
      date: date,
      group_id: group_id,
      attended: attended,
      excuse: [],
      absent: absent
    }
  end

  private
  def student_ids(course_id, group_id)
    filename = "data/students_#{course_id}.json"
    json = JSON.parse(File.read(filename))
    json["students"].map { |s| s[2].to_s }
  end

  def dates(date, interval)
    14.times.map do
      date = date + (rand(interval) + 6)
      date.strftime("%d/%m/%Y")
    end
  end

  def group(id, start_date = Date.today, interval = 2)
    {
      group_id: id,
      dates: dates(start_date, interval)
    }
  end

  def groups(max, date, interval)
    max.times.map { |i| group(i, date, interval) }
  end
end
