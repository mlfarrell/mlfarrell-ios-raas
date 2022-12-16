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

//network model to view model
extension ResumeSkillsetModel {
  var viewModel: ResumeSkillsetCardViewModel {
    return ResumeSkillsetCardViewModel(title: title, skills: skillsets.map {
      ResumeSkillsetCardViewModel.Skillset(type: $0.name, skills: $0.skills)
    })
  }
}

