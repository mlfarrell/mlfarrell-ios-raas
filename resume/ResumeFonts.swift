//
//  ResumeFonts.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

///Not trying to get too fancy with these for now
extension UIFont {
  static var resumeMissingFont: UIFont {
    //intentionally jarring to highlight a missed font
    UIFont.italicSystemFont(ofSize: 8)
  }
  
  static var resumeTitle: UIFont {
    UIFont.init(name: "Apple SD Gothic Neo Bold", size: 22) ?? .resumeMissingFont
  }
  
  static var resumeSubtitle: UIFont {
    UIFont.init(name: "Apple SD Gothic Neo Medium", size: 14) ?? .resumeMissingFont
  }
  
  static var resumeBody: UIFont {
    UIFont.init(name: "Apple SD Gothic Neo Medium", size: 12) ?? .resumeMissingFont
  }
  
  static var resumeSkill: UIFont {
    UIFont.init(name: "Apple SD Gothic Neo Medium", size: 12) ?? .resumeMissingFont
  }

  static var resumeSkillName: UIFont {
    UIFont.init(name: "Apple SD Gothic Neo Bold", size: 12) ?? .resumeMissingFont
  }
}
