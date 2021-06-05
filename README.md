# ios-training

## 株式会社ゆめみ さんの iOS 研修

株式会社ゆめみ さんの iOS 研修の課題に沿って学習していく。

- https://github.com/yumemi-inc/ios-training
- [ゆめみの iOS エンジニア研修を公開します！](https://qiita.com/watanave/items/1cefa5aae18f5141c426)

Session 11 まで一旦こなしました。（2021/06/05 時点）

## 目的

- iOS 開発の基本を知るため。

## 環境

- Xcode 12.5
- Swift 5.4

## 進め方

- ブランチ

  - `main`から`session/*`を作成し、課題番号昇順で進める。

- ソースレビュー

  - 個人で行っているため、基本セルフレビュー。

- issues
  - 課題が一通り完了後、気になる点を issues で管理する。

## パッケージ管理

- Swift Package Manager

## 課題以外で意識すること

- iOS Deployment Target を `12.0` に設定する。
  - AppStore に公開されているほとんどのアプリが`12.0`以上を保証しているため。
  - `Scene`と`Application`のライフサイクルの違いを学習するため。
- `Main.storyboard`を使用しない。
  - 通常`Main.storyboard`のみの View 定義はファイルが膨大になってしまい、チーム開発ではコンフリクトが頻繁に起きてしまうので使用しない。そのため削除するのが好ましいらしい。

## Github Actions

- [こちら](https://qiita.com/koogawa/items/ddf86b56d6b82ae11473) を参考に`xcodebuild`で CI ビルドするよう試してみました。
- SPM のキャッシュは[公式ドキュメント](https://qiita.com/koogawa/items/ddf86b56d6b82ae11473)を参考にしました。
