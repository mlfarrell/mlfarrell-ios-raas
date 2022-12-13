//
//  ResumeView.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import UIKit
import SnapKit

class ResumeView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
    
  private func commonInit() {
    let gradientView = NiceGradientView(frame: CGRectZero)
    gradientView.colors = [ .resumeDarkGrey, .resumeBlack ]
    
    addSubview(gradientView)
    gradientView.snp.makeConstraints { make in
      make.leading.trailing.top.bottom.equalToSuperview()
    }
  }
}
