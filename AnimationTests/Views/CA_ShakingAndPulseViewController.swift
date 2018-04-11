//
//  CA_ShackAndPulseViewController.swift
//  AnimationTests
//
//  Created by Michel Anderson Lutz Teixeira on 11/04/2018.
//  Copyright © 2018 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class CA_ShakingAndPulseViewController: UIViewController {
    @IBOutlet weak var tfShaking: ShakingTextField!
    @IBOutlet weak var avatarIv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfShaking.delegate = self
        avatarIv.isUserInteractionEnabled = true
        avatarIv.layer.cornerRadius = avatarIv.frame.width / 2
        avatarIv.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CA_ShakingAndPulseViewController.addPulse))
        tapGestureRecognizer.numberOfTapsRequired = 1
        avatarIv.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    @objc func addPulse(){
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: avatarIv.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor
        view.layer.insertSublayer(pulse, below: avatarIv.layer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfShaking.resignFirstResponder()
    }
}

extension CA_ShakingAndPulseViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tfShaking.shake()
    }
}
