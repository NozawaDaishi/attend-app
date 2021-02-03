# 実行：bin/rails db:reset

User.create!(
    uid: 'DBFBB8E1',
    last_name: '山田',
    first_name: '侑樹',
    klass: 'R4A1',
    number: 171031,
    password: 'password',
    role: 1
)

User.create!(
    uid: 'BBDDB1E1',
    last_name: '長谷川',
    first_name: '翔太郎',
    klass: 'R4A1',
    number: 171032,
    password: 'password',
    role: 1
)

User.create!(
    uid: 'CBDDACE1',
    last_name: '辻川',
    first_name: '弘也',
    klass: 'R4A1',
    number: 171033,
    password: 'password',
    role: 1
)

User.create!(
    uid: 'AB22B9E1',
    last_name: '野崎',
    first_name: '穂美満',
    klass: 'R4A1',
    number: 171034,
    password: 'password',
    role: 1
)

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

User.create!(
    uid: 'uuuuuuid4',
    last_name: '五十嵐',
    first_name: '太郎',
    klass: 'R4A2',
    number: 999992,
    password: 'password',
    role: 2
)

## 毎日出席している生徒
user = User.first
user2 = User.find(2)
5.times do |i|
    user.attends.create!(date: "2021-01-#{i + 19} 09:00:00")
    user2.attends.create!(date: "2021-01-#{i + 19} 09:00:00")
end

user.attends.create!(date: "2021-01-26 09:00:00")
user.attends.create!(date: "2021-01-27 09:00:00")
user.attends.create!(date: "2021-01-28 09:00:00")
user.attends.create!(date: "2021-01-29 09:00:00")
user.attends.create!(date: "2021-02-01 09:00:00")
user.attends.create!(date: Time.zone.now)
