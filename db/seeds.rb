# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@example.com", password: "111111")

customers = Customer.create!(
  [
    {name: 'Shibayu', birthday: '1993/12/30', email: 'shibayu@example.com', password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user1-sauna.jpg"), filename:"user1-sauna.jpg")},
    {name: 'Tetsuya',birthday: '1993/10/30',email: 'tetsuya@example.com',password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user2-marason.jpg"), filename:"user2-marason.jpg")},
    {name: 'Ryo',birthday: '1993/6/11',email: 'ryo@example.com',password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user3-cook.jpg"), filename:"user3-cook.jpg")},
    {name: 'Yumemaru',birthday: '1994/1/23',email: 'Yumemaru@example.com',password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user4-Drink.jpg"), filename:"user4-Drink.jpg")},
    {name: 'Mushimegane',birthday: '1992/9/23',email: 'mushimegane@example.com',password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user5-megane.jpg"), filename:"user5-megane.jpg")},
    {name: 'Toshimitsu',birthday: '1993/7/17',email: 'toshimitsu@example.com',password: '111111', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user6-car.jpg"), filename:"user6-car.jpg")}

    ]
  )

Hobby.create!(
  [
    {name: '温泉', customer_id: customers[0].id},
    {name: 'サウナ', customer_id: customers[0].id},
    {name: 'スプラ', customer_id: customers[1].id},
    {name: '黒烏龍茶', customer_id: customers[1].id},
    {name: 'コーヒー', customer_id: customers[2].id},
    {name: 'アストンマーティン', customer_id: customers[2].id},
    {name: 'お酒', customer_id: customers[3].id},
    {name: '野球', customer_id: customers[4].id},
    {name: '歌', customer_id: customers[5].id}
    ]
  )

Post.create!(
  [
    {title: '温泉旅行', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image1-onsen.jpg"), filename:"image1-onsen.jpg"), body: '「第一弾」家族で温泉旅行！！サウナなかったけど温泉最高〜！！', :hobby_id =>'1', customer_id: customers[0].id},
    {title: '大会に向けて', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image2-penki.jpg"), filename:"image2-penki.jpg"), body: '大会まであと少しもう特訓の日々を送っています！！配信見てね〜', :hobby_id =>'3', customer_id: customers[1].id},
    {title: 'Rコーヒー', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image3-coffee.jpg"), filename:"image3-coffee.jpg"),body: '世界一のコーヒーを淹れれるように！！', :hobby_id =>'5', customer_id: customers[2].id},
    {title: 'ビールが一番', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image4-beer.jpg"), filename:"image4-beer.jpg"),body: '仕事終わりの最高のひと時でごわす', :hobby_id =>'7', customer_id: customers[3].id},
    {title: '始球式', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image5-baseball.jpg"), filename:"image5-baseball.jpg"),body: '投げさせていただきました〜！！緊張した〜', :hobby_id => '8', customer_id: customers[4].id},
    {title: 'Vaundy', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image6-music.jpg"), filename:"image6-music.jpg"),body: 'ライブ最高！！絶対また行く！！', :hobby_id => '9', customer_id: customers[5].id}
    ]
  )
  
Group.create!(
  [
    {name: 'ゲーム同好会', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group1-game.jpg"), filename:"group1-game.jpg"),introduction: '一緒にゲームしてくださる方募集しています！！毎週土曜日の夜９時〜一緒にスプラトゥーンしましょう！！', owner_id: customers[1].id},
    {name: 'Live', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group2-live.jpg"), filename:"group2-live.jpg"),introduction: 'Liveを一緒に行ってくれる方募集しています！！', owner_id: customers[5].id}
    ]
  )