//
//  ResumeEducationCardViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

struct ResumeEducationCardViewModel : ResumeViewModel {
  static var reuseId: String {
    "ResumeEducationCardCell"
  }
  
  struct Education: Identifiable {
    let school: String
    let city: String
    let state: String
    let degree: String
    let field: String
    let date: Date
    
    var id: String { school }
  }
  
  struct Honor: Identifiable {
    let membership: String
    let chapter: String?
    let society: String
    
    var id: String { society }
  }
  
  let title: String
  let schools: [Education]
  let honors: [Honor]
}

//network model to view model
extension ResumeEducationModel {
  var viewModel: ResumeEducationCardViewModel {
    return ResumeEducationCardViewModel(title: title, schools: schools.map {
      ResumeEducationCardViewModel.Education(school: $0.school, city: $0.city, state: $0.state, degree: $0.degree, field: $0.field, date: $0.date)
    }, honors: honors.map {
      ResumeEducationCardViewModel.Honor(membership: $0.membership, chapter: $0.chapter, society: $0.society)
    })
  }
}

