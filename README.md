# P2HACKS2023 アピールシート

プロダクト名

Strollary(ストロラリー)

コンセプト

あなたの夜のプチ体験を共有する、リアルタイムじゃないSNS

対象ユーザ

若者を中心に、夜のお散歩が好きな全ての方へ

利用の流れ


初回起動時：GoogleアカウントでStrollaryアカウントとニックネームを登録

初回以降：

(起動時が夜の場合)

夜の散歩時に見つけたプチ体験（例:綺麗な星が見えた、誰かが作った可愛い雪だるまを見つけた等）を写真に撮ってコメントをつけて投稿。夜の間は他の人の投稿は見えないようになっている。

(起動時が昼の場合)

日の入りの時間でアプリの機能が変化し、前日の他の人の投稿が閲覧可能になる。いいねを押してコミュニケーションを取ったり、他の人のプロフィール画面を閲覧できる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

推しポイント

莫大な情報が常に更新され、忙しない印象がある既存のSNSとは異なり、当アプリはリアルタイムの更新をあえて避けています。一番の特徴は、日の出の時間と日の入りの時間のタイミングで機能が完全に変化することです。日の入りから次の日の日の出までは投稿を、日の出から日の入りまでは他の人の投稿を閲覧したり、いいねをつけたりすることができます。自分の過去の投稿はいつでも見返すことができるため、日記のような役割も果たします。周りにリアルタイムで投稿が共有されないため、SNS疲れがなく、落ち着いた夜にぴったりな新しい形のSNSです。

スクリーンショット(任意)
### 夜
![image](https://github.com/p2hacks2023/pre-02/assets/44548782/f0f49cfb-b692-4bcf-bdf2-4428c2ae2169)
![image](https://github.com/p2hacks2023/pre-02/assets/44548782/4bc6ee53-d852-4880-aa7f-8e5bdac1a620)
![image](https://github.com/p2hacks2023/pre-02/assets/44548782/e25576fa-2742-4d76-93f6-67ed52fb781d)

### 昼
<img width="564" alt="image" src="https://github.com/p2hacks2023/pre-02/assets/44548782/1a69d6bb-5fdf-43bd-b804-92983e8c7779">
<img width="564" alt="image" src="https://github.com/p2hacks2023/pre-02/assets/44548782/c07c54e2-16d0-41b4-8bde-2cc272a7a112">
<img width="564" alt="image" src="https://github.com/p2hacks2023/pre-02/assets/44548782/23998e27-65d8-4994-9a4e-76efedad5b02">


## 開発体制

役割分担...

梶村拓斗(B2):バックエンド、ロジック

木下瑠理(B1):デザイン、カメラ機能、UI

國場あかり(B1):起動画面のUI、いいね一覧

中西瞳俐(B1):アプリベースのUI

開発における工夫した点

- MVVMパターンを採用し、ロジック部分とUI部分を分離して開発を進めました。これにより、サーバーとの連携や複雑な機能などの難易度の高いロジック処理を二年生が、UI部分の設計を一年生が受け持つなどの役割分担ができ，開発工程がより効率化しました。
- できるだけ対面で開発することによって質問や交流がしやすい環境を作りました．

## 開発技術

利用したプログラミング言語

Dart

利用したフレームワーク・ライブラリ

フレームワーク：Flutter

ライブラリ

- riverpod
- freezed
- build_runner
- cloud_firestore
- firebase_core
- firebase_auth
- firebase_storage
- google_sign_in
- json_serializable
- http
- camera

その他開発に使用したツール・サービス ...

- Github
- Discord
- FirebaseStorage
- FirebaseStore
- FirebaseAuth
- api.sunrise-sunset.org
