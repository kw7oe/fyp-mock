require 'csv'

module DataGenerator
  extend self

  def construct_course(id)
    {
      id: id,
      classes: groups(4, Date.new(2018, 3, 26), 3)
    }
  end

  def construct_attendance(course_id, date, group_id)
    attended, absent = student_ids("../fake-data/outputs/test.csv").partition do |s|
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
  def student_ids(file)
    CSV.open(file, "r", headers: true) do |csv|
      csv.map do |line|
        line["studentId"]
      end
    end
  end

  def dates(date, interval)
    14.times.map do
      date = date + (rand(interval) + 6)
      date
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
