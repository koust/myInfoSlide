//
//  myInfoSlideController.swift
//  myInfoSlide
//
//  Created by Batuhan Saygili on 19.07.2018.
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

public protocol myInfoSlideDelegate {
    func handlerAction(sender:UIButton)
}

public class myInfoSlideController: UIViewController {
    
    
    public var delegate:myInfoSlideDelegate?

    public  var dataImage:[UIImage]         = []
    public  var dataTitle:[String]          = []
    public  var yourView                    = UIView()
    public  var yourViewBg                  = UIColor.white
    public  var yourButtonBg                = UIColor.white
    public  var yourButtonTitleColor        = UIColor.black
    public  var yourButtonWidth:CGFloat     = 45
    public  var yourButtonTitle             = "Skip"
    public  var yourTitleColor              = UIColor.black
    public  var yourTitleSize: CGFloat      = 16
    public  var yourFontName:String         = "Avenir-Light"
    
    
    private var myView                          = UIView()
    private let myButton                        = UIButton()
    private let myTitle                         = UILabel()
    private let mockUp                          = UIImageView()
    private let contentImage                    = UIImageView()
    private let pageControl                     = UIPageControl()
    private var mockUpHeight:CGFloat            = 550
    private var contentImageTopconstant:CGFloat = 100
    
    
    /* Create Slide View  */
    private func createSlide(){
    
    myView.frame                            = CGRect(x: 0, y: 0, width: yourView.frame.size.width, height: yourView.frame.size.height)
    myView.backgroundColor                  = yourViewBg
    
        
    
        
        
    myView.addSubview(myButton)
    myView.addSubview(myTitle)
    myView.addSubview(mockUp)
    myView.addSubview(contentImage)
    myView.addSubview(pageControl)
    yourView.addSubview(myView)
        
        
    
    createButton()
    createTitle()
    createMockUp()
    createContent()
    createPageControl()
    }
    
    
    private func createButton(){
    myButton.translatesAutoresizingMaskIntoConstraints              = false
    myButton.backgroundColor                                        = yourButtonBg
        
    myButton.setTitleColor(yourButtonTitleColor, for: .normal)
    myButton.setTitle(yourButtonTitle, for: .normal)
        
    myButton.topAnchor.constraint(equalTo: myView.topAnchor, constant: 30).isActive                 = true
    myButton.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -25).isActive            = true
    myButton.widthAnchor.constraint(greaterThanOrEqualToConstant: yourButtonWidth).isActive         = true
    myButton.heightAnchor.constraint(equalToConstant: 45).isActive                                  = true

    myButton.addTarget(self, action:#selector(skip), for: .touchUpInside)
    }
    
    private func createTitle(){
    myTitle.translatesAutoresizingMaskIntoConstraints               = false
    myTitle.textColor                                               = yourTitleColor
    myTitle.font                                                    = UIFont(name: yourFontName, size: yourTitleSize)
    myTitle.text                                                    = dataTitle[0]
    myTitle.numberOfLines                                           = 0
    myTitle.lineBreakMode                                           = .byWordWrapping
    myTitle.textAlignment                                           = .center
    myTitle.alpha                                                   = 0
        
    myTitle.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 15).isActive                 = true
    myTitle.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -15).isActive              = true
    myTitle.bottomAnchor.constraint(equalTo: mockUp.topAnchor, constant: -5).isActive                = true
    myTitle.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: -15).isActive             = true
    }
    
    private func createMockUp() {
    mockUp.translatesAutoresizingMaskIntoConstraints               = false
    mockUp.image                                                   = UIImage(named: "mockup", in: Bundle(for: type(of: self)), compatibleWith: nil)
    mockUp.contentMode                                             = .bottom

    deviceScreenSize()

    mockUp.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: 0).isActive                = true
    mockUp.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 35).isActive                   = true
    mockUp.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -35).isActive                = true
    mockUp.heightAnchor.constraint(lessThanOrEqualToConstant: mockUpHeight).isActive                  = true
        
        
    }
    
    
    private func deviceScreenSize(){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                mockUpHeight            = 400
                mockUp.contentMode      = .scaleAspectFit
                contentImageTopconstant = 57
            case 1334:
                break
            case 1920, 2208:
                break
            case 2436:
                break
            default:
                break
            }
        }

    }
    
    
    private func createContent(){
    contentImage.translatesAutoresizingMaskIntoConstraints               = false
    contentImage.image                                                   = dataImage[0]
    contentImage.contentMode                                             = .scaleAspectFit
    contentImage.alpha                                                   = 0
        
    contentImage.bottomAnchor.constraint(equalTo: mockUp.bottomAnchor, constant: 58).isActive                   = true
    contentImage.topAnchor.constraint(equalTo: mockUp.topAnchor, constant:contentImageTopconstant).isActive     = true
    contentImage.leftAnchor.constraint(equalTo: mockUp.leftAnchor, constant: 0).isActive                        = true
    contentImage.rightAnchor.constraint(equalTo: mockUp.rightAnchor, constant: 0).isActive                      = true
    }
    
    
    private func createPageControl(){
    pageControl.translatesAutoresizingMaskIntoConstraints                = false
    pageControl.numberOfPages                                            = dataImage.count
    pageControl.translatesAutoresizingMaskIntoConstraints                = false
    pageControl.currentPageIndicatorTintColor                            = UIColor.orange
    pageControl.pageIndicatorTintColor                                   = UIColor.black.withAlphaComponent(0.8)
        
        
    pageControl.bottomAnchor.constraint(equalTo: mockUp.bottomAnchor, constant: -30).isActive              = true
    pageControl.leftAnchor.constraint(equalTo: mockUp.leftAnchor, constant: 30).isActive                   = true
    pageControl.rightAnchor.constraint(equalTo: mockUp.rightAnchor, constant: -30).isActive                = true
    }
    
    
    private func swipe(){
        let directions: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
            gesture.direction = direction
            self.myView.addGestureRecognizer(gesture)
        }
    }
    
    @objc  private func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        if gesture.direction == .left {
            if pageControl.currentPage < dataImage.count-1 {
              pageControl.currentPage = pageControl.currentPage + 1
                
                previewAnimation()
            }
        }else if gesture.direction == .right {
            if pageControl.currentPage > 0 {
              pageControl.currentPage = pageControl.currentPage - 1
                
                previewAnimation()
            }
        }
        
              contentImage.image      = dataImage[pageControl.currentPage]
              myTitle.text            = dataTitle[pageControl.currentPage]
        
    }
    
    @objc private func skip(sender:UIButton){
        delegate?.handlerAction(sender: sender)
        
    }
    
    private func previewAnimation(){
            self.contentImage.alpha          = 0
            self.myTitle.alpha               = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.contentImage.alpha          = 1.0
            self.myTitle.alpha               = 1.0
        })
    }
    
    public func  show(){
        createSlide()
        previewAnimation()
        swipe()
    }

}
