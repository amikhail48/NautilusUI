//
//  LightControl.swift
//  UI
//
//  Created by Andrew Mikhail on 7/9/17.
//  Copyright © 2017 Andrew Mikhail. All rights reserved.
//

import UIKit

@IBDesignable class LightControl: UIStackView {
    
    //MARK: Properties
    @IBInspectable var lightButtonSize: CGSize = CGSize(width: 44.0, height: 44.0)

    //MARK: Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func lightButtonTapped(button: UIButton) {
        print("Light Button pressed 👍")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Private Methods
    private func setupButtons() {
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let lightOn = UIImage(named: "lightOn", in: bundle, compatibleWith: self.traitCollection)
        let lightOff = UIImage(named:"lightOff", in: bundle, compatibleWith: self.traitCollection)
        
        // Create the button
        let button = UIButton()
        //button.backgroundColor = UIColor.red
        
        // Set the button images
        button.setImage(lightOff, for: .normal)
        button.setImage(lightOn, for: .selected)
        button.setImage(lightOn, for: .highlighted)
        button.setImage(lightOn, for: [.highlighted, .selected])
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: lightButtonSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: lightButtonSize.width).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(LightControl.lightButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
    }
    
}
