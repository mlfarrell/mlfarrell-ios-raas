//
//  ResumeBlurbCardView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumeBlurbCardView: View {
  @State var viewModel: ResumeBlurbCardViewModel
  
  var body: some View {
    Text(viewModel.blurb)
      .font(.resumeBody)
      .foregroundColor(.resumeBlack)
      .wrapped(with: 16)
  }
}

struct ResumeBlurbCardView_Previews: PreviewProvider {
  static let viewModel = ResumeBlurbCardViewModel(blurb: "I am an expert in the field of Agile mobile application development, modern real-time graphics, data visualization, GPU computing, and video game development. I am formally trained in computer science and modernized software engineering practices with a further specialization in Swift, Objective-C, C++, Apple, Windows & LINUX systems. I’ve helped small teams (up to 5 engineers) in the iOS space navigate complex deliveries through several leadership roles.")
  
  static var previews: some View {
    ResumeBlurbCardView(viewModel: viewModel)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color(white: 0.4))
  }
}
