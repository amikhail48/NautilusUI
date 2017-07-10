//
//  RecordControl.swift
//  UI
//
//  Created by Andrew Mikhail on 7/6/17.
//  Copyright © 2017 Andrew Mikhail. All rights reserved.
//

import UIKit

@IBDesignable class RecordControl: UIStackView {
    
    //MARK: Properties
    @IBInspectable var recordButtonSize: CGSize = CGSize(width: 44.0, height: 44.0)

    
    //MARK: Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
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
        let idleImg = UIImage(named: "idleImg", in: bundle, compatibleWith: self.traitCollection)
        let recordingImg = UIImage(named:"recordingImg", in: bundle, compatibleWith: self.traitCollection)
        
        // Create the button
        let button = UIButton()
        //button.backgroundColor = UIColor.red
        
        // Set the button images
        button.setImage(idleImg, for: .normal)
        button.setImage(recordingImg, for: .selected)
        button.setImage(recordingImg, for: .highlighted)
        button.setImage(recordingImg, for: [.highlighted, .selected])
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: recordButtonSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: recordButtonSize.width).isActive = true
 
        // Setup the button action
        button.addTarget(self, action: #selector(RecordControl.recordButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
    }
    
    //MARK: Button Action
    func recordButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    

}
