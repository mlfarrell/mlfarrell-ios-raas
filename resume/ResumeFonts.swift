//
//  ResumeFonts.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SwiftUI

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

///SwiftUI convenience
extension Font {
  static var resumeTitle: Font {
    Font(UIFont.resumeTitle)
  }
  
  static var resumeSubtitle: Font {
    Font(UIFont.resumeSubtitle)
  }
  
  static var resumeBody: Font {
    Font(UIFont.resumeBody)
  }
  
  static var resumeSkill: Font {
    Font(UIFont.resumeSkill)
  }

  static var resumeSkillName: Font {
    Font(UIFont.resumeSkillName)
  }
}
