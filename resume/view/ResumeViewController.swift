//
//  ViewController.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import UIKit

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
  
  var tableViewController: ResumeTableViewController?

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(backgroundView)
    backgroundView.image = UIImage(named: "background")
    backgroundView.snp.makeConstraints { make in
      make.leading.trailing.top.bottom.equalToSuperview()
    }

    setupTableView()

    view.addSubview(spinner)
    spinner.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.height.equalTo(100)
    }
    Task {
      await load()
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
      models.title?.blurbViewModel,
      models.apps?.viewModel,
      models.skills?.viewModel,
      models.education?.viewModel
    ]
    
    tableViewController?.viewModels = viewModels.compactMap { $0 }
    spinner.stopAnimating()
  }
    
  private func setupTableView() {
    let tvc = ResumeTableViewController(style: .plain)
    
    view.addSubview(tvc.view)
    addChild(tvc)
    tvc.didMove(toParent: self)
    tableViewController = tvc
  }
}

