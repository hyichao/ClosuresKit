# ClosuresKit
A Swift version of BlocksKit, namely, ClosuresKit, from a BlocksKit addict.

# Motivation
BlocksKit is a well known 3rd-party in iOS developing. As a BlocksKit addict, I would like to show greatest respect to it.
However, when I was turning into Swift, I found BlocksKit is not supportive into Swift version. Reasons are claimed in BlocksKit issue263 (<https://github.com/zwaldowski/BlocksKit/issues/263>). But I assume that there are some other important reasons :) Anyway, if you are somehow a BlocksKit addict but using Swift now, please try this. The repo will be improved step by step and any suggestions are welcomed.

# Usage
Basically there are three sections of codes: Core, UIKit and Misc

### Core
In Core, we support some BlocksKit-like extention for CollectionType (Array, Dictionary and Set). Samples are as followings:

* In this sample, the outputs are 2,3,4,5,6,7
```Swift
// perform the closure for each element of the array
let nums = [1,2,3,4,5,6]
nums.ck_each({ (obj) in
  print(obj+1)
})
```
* In this one, the outputs will be "hello.avi" "world.avi" "swift.avi" && "charlie.avi"
```Swift
// mapping a new array processed from input one
let strs = ["hello","world","swift","charlie"]
let ret = strs.ck_map { (obj) -> String in
  return obj.stringByAppendingString(".avi")
  }
  print(ret)
```

### UIKit
As for UIKit section, the implementation turns a little bit complecated as Swift is not supporting runtime as Object-C do. Therefore, adding property dynamically gets more difficult. But still, it is implementatble. Current codes and support the most adorable API as BlocksKit do for tap gesture.

```Swift
// programatically add a button in controller
// when user tap on it, the closure will be executed
let butt = UIButton()
butt.frame = CGRectMake(100, 100, 100, 100)
butt.backgroundColor = UIColor.redColor()
butt.ck_whenTapped { 
  print("Button is tapped")
}
// the same for long press.
butt.ck_whenLongPressed {
  print("Button is long pressed")
}
self.view.addSubview(butt)
```
Is it cool that we don't need to do the action-selector over and over again but simply using `ck_whenTapped`?

# Installation
As I haven't submit the code to CocoaPod Specs repo yet, the current way to use the codes are as follow.

```
pod 'ClosuresKit', :git => 'https://github.com/hyichao/ClosuresKit.git'
```
