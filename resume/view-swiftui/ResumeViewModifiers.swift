//
//  ResumeViewModifiers.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import Foundation
import SwiftUI

struct ResumeViewModifier: ViewModifier {
  let cornerRadius: CGFloat
  
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
      .padding(10)
      .background(.white.opacity(0.9))
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .stroke(Color(white: 0.8), lineWidth: 1.5)
      )
  }
}

extension View {
  func wrapped(with radius: CGFloat = 16) -> some View {
    self.modifier(ResumeViewModifier(cornerRadius: radius))
  }
}
