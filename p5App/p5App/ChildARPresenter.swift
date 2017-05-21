//
//  ChildARPresenter.swift
//  p5App
//
//  Created by Abel Fernandez on 21/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import HDAugmentedReality

class ChildARPresenter: ARPresenter {

    override func yPositionForAnnotationView(_ annotationView: ARAnnotationView, arStatus: ARStatus) -> CGFloat
    {
        let y  = super.yPositionForAnnotationView(annotationView, arStatus: arStatus)
        return y - 150
        
    }

}
