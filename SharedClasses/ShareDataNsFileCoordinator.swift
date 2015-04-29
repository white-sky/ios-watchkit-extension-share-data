//
//  ShareDataNsFileCoordinator.swift
//  WhiteSkyShareDataSampleApp
//
//  Created by Rashmi Singh on 4/29/15.
//  Copyright (c) 2015 WhiteSky. All rights reserved.
//

import UIKit

let sharedDataDirName = "sampleAppSharedData"

class ShareDataNsFileCoordinator: NSObject {
  
  func writeData( data: NSData ) {
    
    let filePath = sharedUrlPathForData()
    data.writeToFile(filePath, atomically: true)
  }
  
  func readData() -> NSData? {
  
    let filePath = sharedUrlPathForData()
    return NSData(contentsOfFile: filePath)
  }
  
  private func sharedUrlPathForData() -> String {
    
    let appGroupContainerUrl = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(appGroup)
    let urlPath = appGroupContainerUrl?.path
    let dataDir = "\(urlPath!)/\(sharedDataDirName)"
    
    if NSFileManager.defaultManager().fileExistsAtPath(dataDir ) == false {
      
      var error: NSError?
      
      NSFileManager.defaultManager().createDirectoryAtPath(dataDir, withIntermediateDirectories: true, attributes: nil, error: &error)
    }
    return "\(dataDir)/data.archive"
  }
}
