# VRMPreview
VRM Viewer for macOS

![ScreenShot](https://raw.githubusercontent.com/magicien/VRMPreview/master/resources/screenshot.png)

## System Requirements

- macOS 10.13 (High Sierra) or later

## Install

Download **VRMPreview_vX.X.X.dmg** from [Releases](https://github.com/magicien/VRMPreview/releases/latest).

## Build

It needs to install [Carthage](https://github.com/Carthage/Carthage) to get frameworks.

```
$ git clone https://github.com/magicien/VRMPreview.git
$ cd VRMPreview
$ carthage bootstrap --platform mac
$ xcodebuild
```

## See also

- [VRMQuickLook](https://github.com/magicien/VRMQuickLook/) - macOS QuickLook plugin for VRM files
- [GLTFSceneKit](https://github.com/magicien/GLTFSceneKit/) - glTF loader for SceneKit

