//
//  ResumeSkillsetCardView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumeSkillsetCardView: View {
  @State var viewModel: ResumeSkillsetCardViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
        .font(.resumeTitle)
        .padding(.bottom, 8)
      
      HStack {
        VStack {
          ForEach(viewModel.skills) { skillset in
            HStack {
              Text("\(skillset.type)")
                .font(.resumeSkillName)
                .padding(.bottom, 3)
              Spacer()
            }
          }
        }.frame(width: 150)
        
        VStack {
          ForEach(viewModel.skills) { skillset in
            HStack(spacing: 0) {
              ForEach(skillset.skills) { skill in
                let c = (skill != skillset.skills.last) ? ", " : ""
                Text("\(skill)\(c)")
                  .font(.resumeSkillName)
                  .padding(.bottom, 3)
                  .lineLimit(1)
                  .fixedSize()
              }
              Spacer()
            }
          }
        }
      }
    }
    .foregroundColor(.resumeBlack)
    .wrapped(with: 16)
  }
}

struct ResumeSkillsetCardView_Previews: PreviewProvider {
  static let viewModel = ResumeSkillsetCardViewModel(title: "Skill Set", skills: [
    ResumeSkillsetCardViewModel.Skillset(type: "Languages", skills: [ "Swift", "Objective-C", "C/C++", "JS", "Java" ]),
    ResumeSkillsetCardViewModel.Skillset(type: "APIs & SDKs", skills: "UIKit,CoreData,URLSession,StoreKit2,Metal,SwiftUI,AWSSDK,XCUITest,ARKit".components(separatedBy: ",")),
    ResumeSkillsetCardViewModel.Skillset(type: "Design Patterns", skills: "MVVM,MVC,VIPER".components(separatedBy: ",")),
    ResumeSkillsetCardViewModel.Skillset(type: "Systems & Tools", skills: "CircleCI,CocoaPods,Carthage,fastlane,git,figma".components(separatedBy: ",")),
    ResumeSkillsetCardViewModel.Skillset(type: "Environments", skills: [ "Xcode","nodeJS","Android Studio (NDK)","AWS" ]),
    ResumeSkillsetCardViewModel.Skillset(type: "Devices", skills: "iPad,iPhone,Hololens,HTC Vive,Quest".components(separatedBy: ",")),
  ])
  
  
  static var previews: some View {
    ResumeSkillsetCardView(viewModel: viewModel)
      .previewLayout(.sizeThatFits)
      //.frame(width: 500)
      .padding()
      .background(Color(white: 0.4))
  }
}

extension String: Identifiable {
  public var id: String { self }
}
