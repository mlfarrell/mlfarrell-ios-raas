//
//  NiceGradientView.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import UIKit

class NiceGradientView: UIView {
  var colors: [UIColor]? {
    didSet {
      setNeedsDisplay()
    }
  }
    
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
    
  override func draw(_ rect: CGRect) {
    super.draw(rect)
        
    guard let ctx = UIGraphicsGetCurrentContext(), let colors,
          let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors.map { $0.cgColor } as CFArray, locations: [0, 1])
    else { return }

    //CGGradient supposedly supports nice dithering unlike CAGradientLayer
    ctx.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: bounds.size.height), options: [])
  }
}
