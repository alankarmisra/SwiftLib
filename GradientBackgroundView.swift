//
//  GradientBackgroundView.swift
//

import UIKit
import QuartzCore


class GradientBackgroundView:UIView {
    private var mOriginalBackgroundColor:UIColor?
    
    var gradientBackground:CAGradientLayer? {
        get {
            guard let sublayers = self.layer.sublayers else {
                return nil
            }
            
            if (sublayers[0] is CAGradientLayer)  {
                return sublayers[0] as? CAGradientLayer
            }
            
            return nil
        }
        
        set {
            if gradientBackground != nil {
                self.layer.sublayers?.removeAtIndex(0)
            }
            
            if let newValue = newValue {
                self.layer.sublayers?.insert(newValue, atIndex: 0)
            } else if mOriginalBackgroundColor != nil {
                self.backgroundColor = mOriginalBackgroundColor
            }
        }
    }
    
    func setGradientBackgroundWithColors(colors:[AnyObject]) {
        mOriginalBackgroundColor = self.backgroundColor
        self.backgroundColor = UIColor.blackColor() // Otherwise rotation allows the non-gradient background to show through
        
        if gradientBackground != nil {
            self.layer.sublayers?.removeAtIndex(0)
        }
        
        let bg = CAGradientLayer.init()
        bg.colors = colors
        bg.frame = self.layer.frame
        self.layer.insertSublayer(bg, atIndex: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let bg = gradientBackground {
            setGradientBackgroundWithColors(bg.colors!)
        }
    }
    
}

