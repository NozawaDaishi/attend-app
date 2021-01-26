# 実行：bin/rails db:reset

User.create!(
    uid: 'uuuuuuid',
    last_name: '野沢',
    first_name: 'みか',
    klass: 'R4A1',
    number: 171031,
    password: 'password',
    role: 1
)

User.create!(
    uid: 'uuuuuuid2',
    last_name: '野崎',
    first_name: 'ホビーマン',
    klass: 'R4A1',
    number: 171032,
    password: 'password',
    role: 1
)

User.create!(
    uid: 'uuuuuuid3',
    last_name: '丸山',
    first_name: '太郎',
    klass: 'R4A1',
    number: 999991,
    password: 'password',
    role: 2
)

user = User.first
user.attends.create!(date: Time.now)
