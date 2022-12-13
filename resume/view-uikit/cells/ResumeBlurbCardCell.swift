//
//  ResumeBlurbCardCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumeBlurbCardCell: ResumeCell {
  override var viewModel: ResumeViewModel? {
    didSet {
      guard let viewModel = viewModel as? ResumeBlurbCardViewModel else { return }
      blurbText.text = viewModel.blurb
    }
  }
  
  lazy var blurbText: UITextView = {
    let text = UITextView(frame: CGRectZero)
    
    text.font = .resumeBody
    text.textColor = .resumeBlack
    text.textAlignment = .left
    text.isScrollEnabled = false
    text.isEditable = false
    text.isSelectable = false
    text.backgroundColor = .clear
    return text
  }()

  override func commonInit() {
    super.commonInit()
    
    resumeCellContent.addSubview(blurbText)

    blurbText.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(7)
      make.leading.trailing.equalToSuperview().inset(10)
    }    
  }
}
