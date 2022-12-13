//
//  ResumeEducationCardView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumeEducationCardView: View {
  @State var viewModel: ResumeEducationCardViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
        .font(.resumeTitle)
        .padding(.bottom, 8)
      
      VStack(spacing: 0) {
        ForEach(viewModel.schools) { school in
          Text("\(school.school), \(school.city), \(school.state)")
            .padding(.bottom, 2)
          Text("\(school.degree) in \(school.field), (\(dateFormatter.string(for: school.date) ?? ""))")
            .padding(.bottom, 20)
        }
      }
      
      VStack(spacing: 0) {
        ForEach(viewModel.honors) { honor in
          Text("\(honor.membership), \(honor.chapter ?? "") \(honor.society)")
            .padding(.bottom, 2)
        }
      }
    }
    .font(.resumeBody)
    .foregroundColor(.resumeBlack)
    .wrapped(with: 16)
  }
  
  private var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    
    return dateFormatter
  }
}
  
struct ResumeEducationCardView_Previews: PreviewProvider {
  static let viewModel = ResumeEducationCardViewModel(title: "Education", schools: [
    ResumeEducationCardViewModel.Education(school: "Ohio University", city: "Athens", state: "OH", degree: "M.S.", field: "Computer Science", date: Date(timeIntervalSince1970: 1238544000)),
    ResumeEducationCardViewModel.Education(school: "Salisbury University", city: "Salisbury", state: "MD", degree: "B.S.", field: "Computer Science", date: Date(timeIntervalSince1970: 1143849600))
  ], honors: [
    ResumeEducationCardViewModel.Honor(membership: "Member", chapter: nil, society: "Phi Theta Kappa Honor Society"),
    ResumeEducationCardViewModel.Honor(membership: "Founding Member", chapter: "Theta-Xi Chapter, ", society: "Sigma Pi Fraternity International"),
    ResumeEducationCardViewModel.Honor(membership: "Member", chapter: nil, society: "Theta Tau Professional Engineering Fraternity")
  ])
  
  static var previews: some View {
    ResumeEducationCardView(viewModel: viewModel)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color(white: 0.4))
  }
}
