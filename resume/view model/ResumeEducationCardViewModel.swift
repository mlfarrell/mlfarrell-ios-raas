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
  
  struct Education {
    let school: String
    let city: String
    let state: String
    let degree: String
    let field: String
    let date: Date
  }
  
  struct Honor {
    let membership: String
    let chapter: String?
    let society: String
  }
  
  let title: String
  let schools: [Education]
  let honors: [Honor]
}

extension ResumeEducationCardViewModel {
  private var schoolsParagraphStyle: NSParagraphStyle {
    let style = NSMutableParagraphStyle()
    
    style.alignment = .center
    style.lineSpacing = 4.0
    return style
  }
  
  var educationString: NSAttributedString {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    
    let schoolsString = schools.map {
      "\($0.school), \($0.city), \($0.state)\n\($0.degree) in \($0.field) (\(dateFormatter.string(from: $0.date)))"
    }.joined(separator: "\n\n")
    
    let honorsString = honors.map {
      "\($0.membership), \($0.chapter ?? "") \($0.society)"
    }.joined(separator: "\n")
    
    return NSAttributedString(string: schoolsString + "\n\n" + honorsString, attributes: [
      .font: UIFont.resumeBody,
      .paragraphStyle: schoolsParagraphStyle
    ])
  }
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

