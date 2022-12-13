//
//  ResumeSkillsetCardViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

struct ResumeSkillsetCardViewModel : ResumeViewModel {
  static var reuseId: String {
    "ResumeSkillsetCardCell"
  }
  
  struct Skillset: Identifiable {
    let type: String
    let skills: [String]
    var id: String { type }
  }
  
  let title: String
  let skills: [Skillset]
}

extension ResumeSkillsetCardViewModel {
  private var skillsParagraphStyle: NSParagraphStyle {
    let style = NSMutableParagraphStyle()
    
    style.lineSpacing = 8.5
    style.tabStops = [
      NSTextTab(textAlignment: .left, location: 0),
      NSTextTab(textAlignment: .left, location: 150)
    ]
    return style
  }
  
  var skillsString: NSAttributedString {
    let paragraphStyle = skillsParagraphStyle
    let typeAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.resumeSkillName,
      .paragraphStyle: paragraphStyle
    ]
    let skillAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.resumeSkill,
      .paragraphStyle: paragraphStyle
    ]
    let newline = NSAttributedString(string: "\n", attributes: skillAttributes)
    
    let skillsString = skills.map { (skill: Skillset) -> NSAttributedString in
      NSAttributedString(string: skill.type, attributes: typeAttributes) + NSAttributedString(string: "\t", attributes: skillAttributes) +
      NSAttributedString(string: skill.skills.joined(separator: ", "), attributes: skillAttributes)
    }.reduce(NSAttributedString()) {
      return $0+newline+$1
    }
    
    return skillsString
  }
}

//network model to view model
extension ResumeSkillsetModel {
  var viewModel: ResumeSkillsetCardViewModel {
    return ResumeSkillsetCardViewModel(title: title, skills: skillsets.map {
      ResumeSkillsetCardViewModel.Skillset(type: $0.name, skills: $0.skills)
    })
  }
}

