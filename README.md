# EMPopView
A popview framework with Swift 3.0 includes `LoadingView`, `ProgressView`, `SheetView` and `AlertView`.

# 中文介绍
你可以在[「这里」](http://www.jianshu.com/p/f5d4157dfd51)找到详细的中文介绍和扩展方法。

# Requirements
- iOS 10
- Xcode 8

# Integration
Use cocoaPods like this:
```C
pod `EMPopView`
```

# Usage
## Example
Just read the code in example.

## Regist
To let popview know when the screen rotation. Put this code in `AppDelegate`.
```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        EMPopViewFactory.regist()
        return true
    }
```

## Config
Before use the popview, we need to create a config object.
```swift
    let config = EMLoadingViewConfig.init(colorStyle: .white,
                                          showAniStyle: .fadeIn,
                                          closeAniStyle: .fadeOut)
```
## Show
Now we get an `EMLoadingViewConfig`. We can use it to config an `EMLoadingView` like this:
```swift
    let index = EMPopViewFactory.showView(withType: .loading, config: config)
```

## Close
The value of `index` is the index of the `EMLoadingView` we already buld. When we want to close this view, we need to let `EMPopViewFactory` know the `index`.
```swift
    EMPopViewFactory.closeView(withIndex: index)
```

# Extension
Edit the code. 
Add some option in `EMPopViewShowAnimationStyle` and `EMPopViewCloseAnimationStyle` to extension animations.
Add some option in `EMPopViewColorStyle` to extension skins.