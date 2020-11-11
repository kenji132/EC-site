# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "admin@admin.com",
    password: "wwwwww"
)

Genre.create!(
    genre_name: "フランスパン"
)
Genre.create!(
    genre_name: "食パン"
)
Genre.create!(
    genre_name: "菓子パン"
)


    Item.create(
        genre_id: Genre.find(1).id,
        name: "バケット",
        description: "フランス語で「棒」という意味を持つフランスパン。
        パリパリの外皮を味わいたい方にオススメです。
        薄く輪切りにしてカナッペにもどうぞ。",
        without_tax: "300",
        image: File.open('./app/assets/images/test.jpeg')
    )
    Item.create(
        genre_id: Genre.find(2).id,
        name: "食パン",
        description: "「熱湯中種製法」で生まれるモチモチ、しっとりとした食感と
        小麦本来の風味を味わうことができるほのかな甘さが特徴です。",
        without_tax: "350",
        image: File.open('./app/assets/images/test2.jpg')
    )
    Item.create(
        genre_id: Genre.find(3).id,
        name: "アップルパイ",
        description: "シナモンをきかせて甘く煮たリンゴとレーズンを包みました。
        香り豊かな特製アップルパイです。",
        without_tax: "350",
        image: File.open('./app/assets/images/test3.jpg')
    )
    Item.create(
        genre_id: Genre.find(3).id,
        name: "ベーグル",
        description: "もっちり食べ応えがあり、甘みのある紅茶風味の生地で仕上げた特製ベーグルです。",
        without_tax: "350",
        image: File.open('./app/assets/images/test4.jpg')
    )

