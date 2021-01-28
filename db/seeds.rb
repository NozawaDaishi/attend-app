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

## R4A1
10.times do |i|
    User.create!(
        uid: 'uuid' + (i + 1).to_s,
        last_name: Faker::Name::last_name,
        first_name: Faker::Name::first_name,
        klass: 'R4A1',
        number: 171032 + i,
        password: 'password',
        role: 1
    )
end

## R4A2
10.times do |i|
    User.create!(
        uid: 'uuuid' + (i + 1).to_s,
        last_name: Faker::Name::last_name,
        first_name: Faker::Name::first_name,
        klass: 'R4A2',
        number: 172031 + i,
        password: 'password',
        role: 1
    )
end

## 先生
User.create!(
    uid: 'uuuuuuid3',
    last_name: '丸山',
    first_name: '太郎',
    klass: 'R4A1',
    number: 999991,
    password: 'password',
    role: 2
)

## 毎日出席している生徒
user = User.first
user2 = User.find(2)
5.times do |i|
    user.attends.create!(date: "2021-01-2#{i + 19} 09:00:00")
    user2.attends.create!(date: "2021-01-2#{i + 19} 09:00:00")
end

user.attends.create!(date: "2021-01-26 09:00:00")
user.attends.create!(date: Time.zone.now)