# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    uid: 'uuuuuuid',
    last_name: '野沢',
    first_name: 'みか',
    klass: 'R4A1',
    student_number: '171031',
    password: 'password',
    role: 1
)

User.create!(
    uid: 'uuuuuuid2',
    last_name: '野崎',
    first_name: 'ホビーマン',
    klass: 'R4A1',
    student_number: '171032',
    password: 'password',
    role: 1
)

User.create!(
    uid: 'uuuuuuid3',
    last_name: '丸山',
    first_name: '太郎',
    klass: 'R4A1',
    number: nil,
    password: 'password',
    role: 2
)

user = User.first
user.attends.create!(date: Time.now)
