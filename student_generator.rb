require 'faker'

module StudentGenerator
  extend self

  HEADER = [
    "name",
    "email",
    "studentId",
    "icOrPassport",
    "nationality",
    "contactNumber",
    "birthDate",
    "programme",
    "intake",
    "semester"
  ]

  PROGRAMME = [
    "BCS",
    "BIT",
    "BCNS",
    "BIS",
    "BSE"
  ]

  INTAKE_YEAR = [
    "2014",
    "2015",
    "2016",
    "2017"
  ]

  INTAKE_MONTH = [
    "01",
    "03",
    "08"
  ]
  def generate_random_programme
    PROGRAMME[rand(5)]
  end

  # Our sem end at 201808
  # Hence, year = 2018, month = INTAKE_MONTH.index(08) = 2
  def calculate_semester(month, year)
    y = 2018 - year.to_i
    m = 2 - INTAKE_MONTH.index(month)

    (y * 3) + m
  end

  def generate_random_intake_and_semester
    month = INTAKE_MONTH[rand(3)]
    year = INTAKE_YEAR[rand(4)]
    intake = year + month
    semester = calculate_semester(month, year)

    [intake, semester]
  end

  def generate
    name = Faker::Name.name
    student_id = Faker::Number.between(12000000, 16000000)
    email = "#{student_id}@imail.sunway.edu.my"
    ic_or_passport = Faker::IDNumber.valid
    nationality = "Malaysian"
    contact_number = Faker::PhoneNumber.cell_phone
    birth_date = Faker::Date.birthday(18, 25).strftime("%d/%m/%Y")
    programme = generate_random_programme
    intake, semester = generate_random_intake_and_semester

    [name, email, student_id, ic_or_passport, nationality,
     contact_number, birth_date, programme, intake, semester]
  end
end
