//
//  ChildARAnnotationView.swift
//  p5App
//
//  Created by Abel Fernandez on 21/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import HDAugmentedReality

class ChildARAnnotationView: ARAnnotationView, UIGestureRecognizerDelegate {
    open var titleLabel: UILabel?
    open var infoButton: UIButton?
    open var image:UIImage?
    open var littleDescription:String?
    private var imageView:UIImageView?
    open var arFrame: CGRect = CGRect.zero  // Just for test stacking
    override open func initialize()
    {
        super.initialize()
        self.loadUi()
    }
    
    func loadUi()
    {
        // Title label
        self.titleLabel?.removeFromSuperview()
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        self.addSubview(label)
        self.titleLabel = label
        
        // Info button
        self.infoButton?.removeFromSuperview()
        let button = UIButton(type: UIButtonType.detailDisclosure)
        button.isUserInteractionEnabled = false   // Whole view will be tappable, using it for appearance
        button.tintColor = UIColor.white
        self.addSubview(button)
        self.infoButton = button
        
        //ImageView
        self.imageView?.removeFromSuperview()
        let imgView = UIImageView(frame: CGRect(x: 0 , y: 0, width: 40, height: 40))
        self.addSubview(imgView)
        self.imageView = imgView
        
        // Gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ChildARAnnotationView.tapGesture))
        self.addGestureRecognizer(tapGesture)
        
        // Other
        self.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        self.layer.cornerRadius = 5
        
        if self.annotation != nil
        {
            self.bindUi()
        }
    }
    
    func layoutUi()
    {
        let buttonWidth: CGFloat = 40
        let buttonHeight: CGFloat = 40
        
        self.imageView?.frame = CGRect(x:  55, y: 5, width: 40, height: 40);
        self.titleLabel?.frame = CGRect(x: 40, y: 20, width: self.frame.size.width - buttonWidth - 5, height: self.frame.size.height);
        self.infoButton?.frame = CGRect(x: self.frame.size.width - buttonWidth, y: self.frame.size.height/2 - buttonHeight/2, width: buttonWidth, height: buttonHeight);
    }
    
    // This method is called whenever distance/azimuth is set
    override open func bindUi()
    {
        if let annotation = self.annotation, let title = annotation.title
        {
            self.titleLabel?.text = title
        }
        
        if let image = self.image {
            let reduceImage = image.resizeImage(newWidth: 40)
            self.imageView?.image = reduceImage
        }
    }
    
    open override func layoutSubviews()
    {
        super.layoutSubviews()
        self.layoutUi()
    }
    
    open func tapGesture()
    {
        if let annotation = self.annotation
        {
            let alertView = UIAlertView(title: annotation.title, message: self.littleDescription, delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }

    

}
