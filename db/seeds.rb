# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.create!(title: "ネーションズリーグ決勝2021　フランス対スペインを見て",
                abstract: "10月11日（日本時間何時）にネーションズリーグ2021決勝が行われ、フランスが2対1でスペインを破り今大会初の優勝を果たした。ベンゼマを筆頭とする豪華スター陣を有するフランスと若返りを測るスペインのビックマッチを見た感想を述べる。",
                content: "
                <h2>1初めに<h2>
                <p></p>
                <h2>2フォーメーション<h2>
                <div class='flance'>
                  <p>Lloris</p>
                </div>
                <div class='spain'>
                  <p>Unai Simon</p>
                </div>
                <h2>3結果<h2>
                <p>スペイン 1 - 2 フランス</p>
                <p>Goal 64Oyalzabal 66Benzema 80Mbappe</p>
                <h2>4感想<h2>
                <p>フランスのサッカーは楽しい。特にベンバペ。ポグバも素晴らしい。チュアメニが一気に話題になる。スペインは悪くないけど、マドリディスタとしては一人もマドリーの選手がいないのはさみしい。</p>
                <h2>5まとめ<h2>
                
                ")

99.times do |n|
  Article.create!(title: "Article #{n}",
                  abstract: "Article #{n}の概要です。",
                  content: "Article #{n}の内容です。")
end