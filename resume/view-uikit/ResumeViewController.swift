//
//  ViewController.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import UIKit
import SwiftUI

class ResumeViewController: UIViewController {
  lazy var spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(frame: CGRectZero)
    spinner.style = .large
    spinner.hidesWhenStopped = true
    spinner.startAnimating()
    return spinner
  }()
  
  lazy var backgroundView: UIImageView = {
    let imageView = UIImageView(frame: CGRectZero)
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  lazy var swiftuiSeg: UISegmentedControl = {
    let seg = UISegmentedControl(items: ["UIKit", "SwiftUI"])
    seg.addTarget(self, action: #selector(uiModeDidChange), for: .valueChanged)
    seg.selectedSegmentIndex = 0
    seg.setTitleTextAttributes([.foregroundColor: UIColor.resumeWhite], for: .normal)
    seg.setTitleTextAttributes([.foregroundColor: UIColor.resumeBlack], for: .selected)
    return seg
  }()

  var tableViewController: ResumeTableViewController?
  var swiftUIViewController: UIViewController?

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
    
    //load remote content..
    Task {
      await load()
    }
  }
  
  private func setupUI() {
    view.addSubview(backgroundView)
    backgroundView.image = UIImage(named: "background")
    backgroundView.snp.makeConstraints { make in
      make.leading.trailing.top.bottom.equalToSuperview()
    }

    addTableView()
    
    view.addSubview(swiftuiSeg)
    swiftuiSeg.snp.makeConstraints { make in
      make.bottom.right.equalToSuperview().inset(20)
      make.width.equalTo(200)
      make.height.equalTo(50)
    }

    view.addSubview(spinner)
    spinner.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.height.equalTo(100)
    }
  }
  
  func load() async {
    let resumeService = ServiceContainer.shared.resumeService
    
    async let title = resumeService.getResume()
    async let contact = resumeService.getContact()
    async let apps = resumeService.getApps()
    async let skills = resumeService.getSkills()
    async let education = resumeService.getEducation()
    
    let models: (title: ResumeModel?, contact: ResumeContactModel?, apps: ResumePublishedAppsModel?, skills: ResumeSkillsetModel?, education: ResumeEducationModel?)
    models = await (title, contact, apps, skills, education)
        
    let viewModels: [ResumeViewModel?] = [
      models.title?.viewModel,
      models.contact?.viewModel,
      models.title?.blurbViewModel,
      models.apps?.viewModel,
      models.skills?.viewModel,
      models.education?.viewModel
    ]
    
    tableViewController?.viewModels = viewModels.compactMap { $0 }
    spinner.stopAnimating()
  }
  
  @objc func uiModeDidChange(_ sender: UISegmentedControl) {
    UIView.transition(with: view, duration: 0.6, options: [ .transitionCrossDissolve ]) { [weak self] in
      guard let self else { return }
      
      switch sender.selectedSegmentIndex {
      case 0:
        self.removeSwiftUIView()
        self.addTableView()
      case 1:
        self.removeTableView()
        self.addSwiftUIView()
      default: break
      }
    }
  }
    
  private func addTableView() {
    let tvc = tableViewController ?? ResumeTableViewController(style: .plain)
    
    view.addSubview(tvc.view)
    addChild(tvc)
    tvc.didMove(toParent: self)
    tableViewController = tvc
  }
  
  private func removeTableView() {
    tableViewController?.willMove(toParent: nil)
    tableViewController?.view.removeFromSuperview()
    tableViewController?.removeFromParent()
  }
  
  private func addSwiftUIView() {
    guard let viewModels = tableViewController?.viewModels else { return }
    guard let titleCardViewModel = viewModels.first(where: { $0 is ResumeTitleCardViewModel }) as? ResumeTitleCardViewModel,
          let addressViewModel = viewModels.first(where: { $0 is ResumeAddressContactCardViewModel }) as? ResumeAddressContactCardViewModel,
          let blurbViewModel = viewModels.first(where: { $0 is ResumeBlurbCardViewModel }) as? ResumeBlurbCardViewModel,
          let appsViewModel = viewModels.first(where: { $0 is ResumePublishedAppsCardViewModel }) as? ResumePublishedAppsCardViewModel,
          let skillsViewModel = viewModels.first(where: { $0 is ResumeSkillsetCardViewModel }) as? ResumeSkillsetCardViewModel,
          let educationViewModel = viewModels.first(where: { $0 is ResumeEducationCardViewModel }) as? ResumeEducationCardViewModel
    else { return }
    
    let suivc = swiftUIViewController ?? UIHostingController(rootView: ResumeListView(titleViewModel: titleCardViewModel, addressViewModel: addressViewModel,
                                                                                      blurbViewModel: blurbViewModel, appsViewModel: appsViewModel, skillsViewModel: skillsViewModel,
                                                                                      educationViewModel: educationViewModel))
    view.insertSubview(suivc.view, belowSubview: swiftuiSeg)
    addChild(suivc)
    suivc.didMove(toParent: self)
    
    suivc.view.backgroundColor = .clear
    suivc.view.snp.removeConstraints()
    suivc.view.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.center.equalToSuperview()
      //make.width.equalTo(600)
      make.width.equalToSuperview().inset(50)
    }
    
    swiftUIViewController = suivc
  }
  
  private func removeSwiftUIView() {
    swiftUIViewController?.willMove(toParent: nil)
    swiftUIViewController?.view.removeFromSuperview()
    swiftUIViewController?.removeFromParent()
  }
}

