//
//  ViewController.swift
//  myInfoSlide
//
//  Created by Batuhan Saygili on 19.07.2018.
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

class ViewController: UIViewController,myInfoSlideDelegate {

 
    

    let myInfoSlideVC = myInfoSlideController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myInfoSlideVC.delegate        = self
        myInfoSlideVC.yourView        = self.view
        myInfoSlideVC.yourButtonTitle = "Geç"
        myInfoSlideVC.dataImage     = [UIImage(named: "deneme1"),UIImage(named: "deneme2"),UIImage(named: "deneme3"),UIImage(named: "deneme4"),UIImage(named: "deneme5")] as! [UIImage]
        myInfoSlideVC.dataTitle     = ["Ucuza tatil yapmak çok kolay","Detaylandırılmış kategoriler","Özel kampanya sayfası","İstediğiniz kampanyayı kaydedin","Artık ilginizi çekmiyor mu?"]
        myInfoSlideVC.show()
    }

    func handlerAction(sender: UIButton) {
        print("skip")
    }

}

