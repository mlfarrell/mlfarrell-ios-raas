//
//  ResumeBlurbCardViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation

struct ResumeBlurbCardViewModel : ResumeViewModel {
  static var reuseId: String {
    "ResumeBlurbCardCell"
  }
  
  let blurb: String
}

//network model to view model
extension ResumeModel {
  var blurbViewModel: ResumeBlurbCardViewModel {
    return ResumeBlurbCardViewModel(blurb: description)
  }
}

