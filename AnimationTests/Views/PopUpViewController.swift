//
//  PopUpViewController.swift
//  AnimationTests
//
//  Created by Michel Anderson Lutz Teixeira on 11/04/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        addItemView.layer.cornerRadius = 5
    }
    
    func animateIn() {
        view.addSubview(addItemView)
        addItemView.center = view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = nil
            
        }) { (success: Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        animateIn()
    }
    @IBAction func dissmissPopup(_ sender: UIButton) {
        animateOut()
    }
}
