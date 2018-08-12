# VRMPreview
macOS用VRMビューア

![ScreenShot](https://raw.githubusercontent.com/magicien/VRMPreview/master/resources/screenshot.png)

## 対応システム

- macOS 10.13 (High Sierra) 以降

## インストール方法

1. [Releases](https://github.com/magicien/VRMPreview/releases/latest)ページから最新の「**VRMPreview_vX.X.X.dmg**」をダウンロードする。

2. dmg中の「VRMPreview」を「Applications」にコピーする。


## ビルド方法（改造したい人向け）

[Carthage](https://github.com/Carthage/Carthage)が無い場合はインストールする。

その後、下記コマンドを実行する。

```
$ git clone https://github.com/magicien/VRMPreview.git
$ cd VRMPreview
$ carthage bootstrap --platform mac
$ xcodebuild
```

## 関連リポジトリ

- [VRMQuickLook](https://github.com/magicien/VRMQuickLook/) - macOS、VRM用QuickLookプラグイン
- [GLTFSceneKit](https://github.com/magicien/GLTFSceneKit/) - SceneKit用glTFローダ

