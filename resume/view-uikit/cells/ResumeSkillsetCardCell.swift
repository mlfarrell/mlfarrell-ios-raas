//
//  ResumeSkillsetCardCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumeSkillsetCardCell: ResumeCell {
  override var viewModel: ResumeViewModel? {
    didSet {
      guard let viewModel = viewModel as? ResumeSkillsetCardViewModel else { return }
      titleLabel.text = viewModel.title
      skillsText.attributedText = viewModel.skillsString
    }
  }
  
  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.font = .resumeTitle
    label.textColor = .resumeBlack
    label.textAlignment = .center
    return label
  }()
  
  lazy var skillsText: UITextView = {
    let text = UITextView(frame: CGRectZero)
    
    text.font = .resumeSubtitle
    text.textColor = .resumeBlack
    text.textAlignment = .left
    text.isScrollEnabled = false
    text.backgroundColor = .clear
    text.isEditable = false
    text.isSelectable = false
    return text
  }()
  
  override func commonInit() {
    super.commonInit()

    resumeCellContent.addSubview(titleLabel)
    resumeCellContent.addSubview(skillsText)

    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(skillsText.snp.top).offset(25)
    }

    skillsText.snp.makeConstraints { make in
      make.bottom.equalToSuperview().inset(7)
      make.leading.trailing.equalToSuperview().inset(10)
    }
  }
}

fileprivate extension ResumeSkillsetCardViewModel {
  private var skillsParagraphStyle: NSParagraphStyle {
    let style = NSMutableParagraphStyle()
    
    style.lineSpacing = 8.5
    style.tabStops = [
      NSTextTab(textAlignment: .left, location: 0),
      NSTextTab(textAlignment: .left, location: 150)
    ]
    return style
  }
  
  var skillsString: NSAttributedString {
    let paragraphStyle = skillsParagraphStyle
    let typeAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.resumeSkillName,
      .paragraphStyle: paragraphStyle
    ]
    let skillAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.resumeSkill,
      .paragraphStyle: paragraphStyle
    ]
    let newline = NSAttributedString(string: "\n", attributes: skillAttributes)
    
    let skillsString = skills.map { (skill: Skillset) -> NSAttributedString in
      NSAttributedString(string: skill.type, attributes: typeAttributes) + NSAttributedString(string: "\t", attributes: skillAttributes) +
      NSAttributedString(string: skill.skills.joined(separator: ", "), attributes: skillAttributes)
    }.reduce(NSAttributedString()) {
      return $0+newline+$1
    }
    
    return skillsString
  }
}
