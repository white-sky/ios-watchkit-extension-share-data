//
//  InterfaceController.swift
//  WhiteSkyShareDataSampleApp WatchKit Extension
//
//  Created by Rashmi Singh on 4/28/15.
//  Copyright (c) 2015 WhiteSky. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
  
  @IBOutlet weak var sharedDataLabel: WKInterfaceLabel!
  
  override func awakeWithContext(context: AnyObject?) {
    
    super.awakeWithContext(context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()

  }
  
  @IBAction func showDataFromNsUserDefaultsTapped() {
    
    if let userDefault = NSUserDefaults(suiteName: appGroup) {
      
      let sharedData  = userDefault.objectForKey(keyIdentifier) as! [String:String]
      sharedDataLabel.setText(sharedData[dataKey])
    }
  }
  
  @IBAction func showDataFromKeychainTapped() {
    
    let keyChainItemWrapper = KeychainItemWrapper(identifier: keyIdentifier, accessGroup: keyChainAccessGroup)
    let kSecValueDataValue = NSString(format: kSecValueData)
    let data = keyChainItemWrapper.objectForKey(kSecValueDataValue) as! NSData

    if let strData = NSString( data: data, encoding: NSUTF8StringEncoding) {

      sharedDataLabel.setText (strData as String)
    }
  }

  @IBAction func showDataFromNsFileCoordinatorTapped() {
    
    if let data = ShareDataNsFileCoordinator().readData(),
      let dataStr = NSString(data: data, encoding: NSUTF8StringEncoding) {
    
        sharedDataLabel.setText (dataStr as String)
    }
  }
}
