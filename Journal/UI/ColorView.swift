//
//  ColorView.swift
//  Journal
//
//  Created by Weili Yi  on 2018/9/3.
//  Copyright © 2018 Weili Yi. All rights reserved.
//

import UIKit

class ColorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createView()
    }
    
    func createView() {
        let radius = max(frame.width, frame.width) / 2
        layer.cornerRadius = radius
        clipsToBounds = true
        backgroundColor = .lightGray
    }
}
