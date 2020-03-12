# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "admin@gmail.com", password: "aaaaaa")
EndUser.create(last_name: "松田", first_name: "良太", last_name_kana: "マツダ", first_name_kana: "リョウタ", post_code: "111-1111", street_address: "大阪府枚方市111", phone_number: "090-1111-1111", email: "ryota@gmail.com", password: "rrrrrr")
EndUser.create(last_name: "小島", first_name: "紗季", last_name_kana: "コジマ", first_name_kana: "サキ", post_code: "222-2222", street_address: "大阪府堺市222", phone_number: "090-2222-2222", email: "saki@gmail.com", password: "ssssss")
