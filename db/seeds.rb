# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |n|
  Customer.create!(
    email: "test#{n + 1}@test.com",
    password: "000000",
    first_name: "山田#{n + 1}",
    last_name: "太朗#{n + 1}",
    first_name_kana: "ヤマダ#{n + 1}",
    last_name_kana: "タロウ#{n + 1}",
    postal_code: "0000000",
    address: "日本#{n + 1}",
    telephone_number: "0000000000",
    is_deleted: false
    )
  end

Admin.create!(
  email: "admin_test@aaa.com",
  password: "111111"
  )