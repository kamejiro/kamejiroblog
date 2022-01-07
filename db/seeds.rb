# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  id: 0,
  category: "人生")

Category.create!(
  id: 1,
  category: "プログラミング")

Category.create!(
  id: 2,
  category: "趣味")

Category.create!(
  id: 3,
  category: "ツール")

Category.create!(
  id: 4,
  category: "サッカー")


categoryTest=Category.last
categoryTest.articles.create!(title: "ネーションズリーグ決勝2021　フランス対スペインを見て",
                abstract: "10月11日（日本時間何時）にネーションズリーグ2021決勝が行われ、フランスが2対1でスペインを破り今大会初の優勝を果たした。ベンゼマを筆頭とする豪華スター陣を有するフランスと若返りを測るスペインのビックマッチを見た感想を述べる。",
                content: "
                <h2>1初めに<h2>
                <blockquote class='twitter-tweet'><p lang='fr' dir='ltr'>🇫🇷 Congratulations France, 2021 UEFA Nations League champions!🎉🎉🎉<a href='https://twitter.com/hashtag/NationsLeague?src=hash&amp;ref_src=twsrc%5Etfw'>#NationsLeague</a> <a href='https://t.co/djSrqtrGmc'>pic.twitter.com/djSrqtrGmc</a></p>&mdash; UEFA EURO 2024 (@EURO2024) <a href='https://twitter.com/EURO2024/status/1447302244567760896?ref_src=twsrc%5Etfw'>October 10, 2021</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>
                <h2>2フォーメーション<h2>
                <div class='flance'>
                  <p>1 ロリス<br>
                  3 キンペンベ<br>
                  4 ヴァラン↓↑ウパメカノ(43’)<br>
                  5 クンデ<br>
                  22 テオ・エルナンデス<br>
                  8 チュアメニ<br>
                  6 ポグバ<br>
                  2 パバール↓↑ドゥビス(79’)<br>
                  7 グリーズマン↓↑ヴェレトゥ(92’)<br>
                  10 エンバペ<br>
                  19 ベンゼマ<br>
                  </p>
                </div>
                <div class='spain'>
                  <p>23 ウナイ・シモン<br>
                  2 アスピリクエタ<br>
                  19 ラポルト<br>
                  12 エリック・ガルシア<br>
                  17 マルコス・アロンソ<br>
                  5 ブスケッツ<br>
                  9 ガビ↓↑コケ(75’)<br>
                  16 ロドリ↓↑フォルナルス(84’)<br>
                  11 フェラン・トーレス↓↑メリーノ(84’)<br>
                  22 サラビア↓↑イェレミー・ピノ(61’)<br>
                  21 オヤルザバル<br>
                  </p>
                </div>
                <h2>3スコアとスタッツ<h2>
                <p>スペイン 1 - 2 フランス
                ⚽64’ オヤルザバル<br>
                ⚽66’ ベンゼマ<br>
                ⚽80’ エンバペ<br>
                </p>
                <p>Goal 64Oyalzabal 66Benzema 80Mbappe</p>
                <h2>4感想<h2>
                <p>ネーションズリーグ2021決勝のスペインvsフランスが〇月〇日に行われ、1-2でフランスが勝利した。若干18歳のガビを中盤に起用した4-3-3のフォーメーションで挑むスペインに対し、フォーメーションを模索中のフランスはベンバペを2トップに据えた5-2-1-2で試合に臨んだ。フランスは前半に3バックの要であるヴァランが怪我で途中交代するというアクシデントに見舞われる。<br>
                試合は前半64分にブスケツのフィードからオヤルザバルの裏抜けから足元に収めるとそのままヴァランの途中交代で入ったズマを容易に引きはがし右下隅に流し込みスペインが先制する。
                しかし、その直後にベンゼマがペナルティエリア左から糸を引くようなシュートをゴール右上隅に流し込み同点に追いつく。
                そして後半80分テオエルナンデスのスルーパスでスペインの最終ラインから抜け出したエンバペが、GKとの1対1になりシザースで鮮やかにかわしてゴールを決めてフランスが勝ち越す。このゴールはエンバペのオフサイドが非常にきわどかったがゴールが認められた。<br>
                <br>
                このまま1-2でタイムアップし、フランスが2回目のネーションズリーグチャンピオンに輝いた。<br>
                <br>
                今のスペインは強いし若い選手が台頭してきている勢いのあるチームだが、普段からレアルマドリーを応援している自分からするとやはり、ワールドクラスなプレーを見たくなってしまう。ファティが怪我から復帰し、代表にも参加できるようになれば間違いなく強くそして見ていて楽しいサッカーをしてくれそうな気がしている。<br>
                <br>
                一方のフランスはどこを見てもタレントぞろいで見ていて楽しいサッカーをする。レアルマドリー所属のベンゼマやマドリディスタが大好きなヴァランとエンバペがいてマドリディスタとしても自然と応援してしまう。どこを取り上げるか迷うがこの試合に関してはチュアメニとポグバの2ボランチが際立っていた。攻撃の起点となるポグバとカンテのようにフィールドの中央全体に顔を出し相手に詰め寄り、おまけに足元もうまいチュアメニ。カマヴィンガを獲得したばかりなのにまたいいフランス人が出てきて目移りしてしまう。今いるタレント陣に加えてまだまだ出てきそうな新しい才能を見られるフランスはこれからも注目したい。<br>
                </p>"
              )

categorys=Category.take(5)
n=1
20.times do
  categorys.each do |category|
    category.articles.create!(title: "Article #{n}",
      abstract: "Article #{n}の概要です。",
      content: "Article #{n}の内容です。",
    )
    n=n+1
  end
end

User.create!(
  name: "kamejiro",
  email: "example@gmail.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true
)

User.create!(
  name: "nonadmin",
  email: "example2@gmail.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: false
)