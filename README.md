# 黄金堂 — Golden Pot Store

Ruby on Railsを学習し、商品一覧・詳細・管理機能を制作した架空のショップです。
個人の経験紹介は[ポートフォリオホームページ](https://tsutomu-iwaya1984.github.io/)をご覧ください。

## 公開作品とソース

| | V1：初期版 | V2：改善版 |
|---|---|---|
| ホームページ | [V1を開く](https://golden-pot-shop-1.onrender.com) | [V2を開く](https://golden-pot-shop-v2.onrender.com) |
| ソース | [main](https://github.com/tsutomu-iwaya1984/golden-pot-shop/tree/main) | [v2/experience](https://github.com/tsutomu-iwaya1984/golden-pot-shop/tree/v2/experience) |
| 内容 | 商品一覧・詳細・商品管理 | 素材の紹介、検索・複合フィルター、管理者ログイン、購入デモ |
| 管理画面 | [V1管理画面](https://golden-pot-shop-1.onrender.com/admin/dashboard/index) | [V2管理画面](https://golden-pot-shop-v2.onrender.com/admin/dashboard) |
| 認証 | HTTP Basic認証 | セッションログイン |

公開ホームページと商品詳細はログインなしで閲覧できます。
管理ページ・商品の登録／編集／削除には管理者認証が必要です。
管理者の認証情報は公開していません。

## 制作とAIの利用

Railsのルーティング、データベース、ビュー、CSS、GitHubによるコード管理、公開環境への配置を学習するための作品です。
AIの支援を使って制作・改善しており、V1とV2の違いを公開ソースで確認できます。
プログラミングは趣味の範囲で学習しています。

## 動作確認

- V1：公開閲覧、管理ページの認証、未認証の変更操作の拒否、商品の入力検証
- V2：素材・サイズ・検索語の条件保持、管理者ログイン／ログアウト、未認証の変更操作の拒否、テスト番号を使った購入デモ
- GitHub Actionsでテスト・スタイル・依存関係とコードの検査を実行

ローカルでのテスト：`RAILS_ENV=test bundle exec rails db:test:prepare test`
本番用アセットの確認：`RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile`

## V1管理者認証

公開環境の `ADMIN_USERNAME` と `ADMIN_PASSWORD` を設定して使用します。
いずれかが未設定の場合、管理者認証は成功しません。
認証情報はGitHubに保存せず、公開環境の秘密の環境変数で管理してください。
V2の設定は[V2デプロイ手順](https://github.com/tsutomu-iwaya1984/golden-pot-shop/blob/v2/experience/docs/DEPLOYMENT.md)を参照してください。

## 注意事項

実際の商品販売・購入・決済は行いません。
V2の購入デモでは画面に示したテスト番号だけを使用し、実在のカード情報は入力しないでください。
Renderのサービスが休止している場合、初回表示に起動待ちが発生します。契約プランはサービス側の設定によって異なります。

旧ポートフォリオは[現在の公開サイト](https://tsutomu-iwaya1984.github.io/)へ集約しました。
