# ios-training

## 株式会社ゆめみ さんの iOS 研修

- https://github.com/yumemi-inc/ios-training
- [ゆめみの iOS エンジニア研修を公開します！](https://qiita.com/watanave/items/1cefa5aae18f5141c426)

ゆめみ さんの iOS 研修の課題に沿って学習していく。

## 目的

- iOS 開発の基本を知るため。

## 課題以外で意識すること

- iOS Deployment Target を `12.0` に設定する。
  - AppStore に公開されているほとんどのアプリが`12.0`以上を保証しているため。
  - 現在参画中プロジェクトでも最低 OS バージョンは`12.0`のため。
  - `SceneDelegate`と`AppDelegate`の違い、`SceneDelegate`の削除要否を学習するため。
- `.storyboard`を使用しない。
  - 現在参画中プロジェクトでも`storyboard`は使用せず、`xib`もしくはコードベースでレイアウト定義を行っているため。

## gitignore

- [gitignore.io](https://www.toptal.com/developers/gitignore)から`Xcode`、`macOS`、`Swift`で作成し、不必要なものを削除して作成。（`CocoaPods`、`Carthage`、`Injection For Xcode`に関するものなど）
