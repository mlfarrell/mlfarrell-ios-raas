//
//  ServiceContainer.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

//There are SEVERAL silly ways to do this.  This is just the first one that pops to my head for a quick demo
//the most important thing is that service instances are not unnecessarily duplicated
@MainActor
class ServiceContainer {
  let networkService: NetworkService
  let errorService: ErrorService
  let resumeService: ResumeService
  
  static var shared = ServiceContainer()
  
  private init() {
    networkService = NetworkService()
    errorService = ErrorService()
    resumeService = ResumeService(errorService: errorService, networkService: networkService)    
  }
}
