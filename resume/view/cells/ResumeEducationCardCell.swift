//
//  ResumeEducationCardCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumeEducationCardCell: ResumeCell {
  override var viewModel: ResumeViewModel? {
    didSet {
      guard let viewModel = viewModel as? ResumeEducationCardViewModel else { return }
      titleLabel.text = viewModel.title
      educationText.attributedText = viewModel.educationString
    }
  }
  
  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.font = .resumeTitle
    label.textColor = .resumeBlack
    label.textAlignment = .center
    return label
  }()
  
  lazy var educationText: UITextView = {
    let text = UITextView(frame: CGRectZero)
    
    text.font = .resumeSubtitle
    text.textColor = .resumeBlack
    text.textAlignment = .center
    text.isScrollEnabled = false
    text.backgroundColor = .clear
    text.isEditable = false
    text.isSelectable = false
    return text
  }()
  
  override func commonInit() {
    super.commonInit()

    resumeCellContent.addSubview(titleLabel)
    resumeCellContent.addSubview(educationText)

    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(educationText.snp.top).offset(-6)
    }

    educationText.snp.makeConstraints { make in
      make.bottom.equalToSuperview().inset(7)
      make.leading.trailing.equalToSuperview().inset(10)
    }
  }
}
