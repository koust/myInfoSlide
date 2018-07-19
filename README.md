![iOS 9.0+](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)
![CocoaPods](https://img.shields.io/cocoapods/v/AFNetworking.svg)
[![Build Status](https://travis-ci.org/TBXark/PinterestSegment.svg?branch=master)](https://travis-ci.org/TBXark/PinterestSegment)

# Welcome to myInfoSlide!

  Presentation helps you to make tutorials, release notes and animated pages. It is enough to just throw the visuals. The phone image is available in the library. 

Recommended resolution : 750 x 1334



![](gorsel.gif)


# Requirements

- iOS 9.0+
- Xcode 9.0
- Swift 4



# Installation

   ## CocoaPods
   You can use [CocoaPods](http://cocoapods.org/) to install `myInfoSlide` by adding it to your `Podfile`:

   ```ruby
    platform :ios, '9.0'
    use_frameworks!
    pod 'myInfoSlide'
   ```

  ## Manually
  1. Download and drop ```myInfoSlideController.swift``` and  ```mockup.png``` in your project.  
  2. Congratulations!  


# Usage 

```swift
    let myInfoSlideVC = myInfoSlideController()
        myInfoSlideVC.delegate        = self
        myInfoSlideVC.yourView        = self.view
        myInfoSlideVC.yourButtonTitle = "Atla"
        myInfoSlideVC.dataImage     = [UIImage(named: "deneme1"),UIImage(named: "deneme2"),UIImage(named: "deneme3"),UIImage(named: "deneme4"),UIImage(named: "deneme5")] as! [UIImage]
        myInfoSlideVC.dataTitle     = ["Ucuza tatil yapmak çok kolay","Detaylandırılmış kategoriler","Özel kampanya sayfası","İstediğiniz kampanyayı kaydedin","Artık ilginizi çekmiyor mu?"]
        myInfoSlideVC.show()
```

You can add ```myInfoSlideDelegate``` class.  For handler button

```swift
   func handlerAction(sender: UIButton) {
        print("skip")
   }
```


## Notes:

- currently only works on portrait mode.
- untested ipad device

## Release History

* 1.0
  first commit
  
