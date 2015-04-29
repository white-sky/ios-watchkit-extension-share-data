//
//  ViewController.swift
//  WhiteSkyShareDataSampleApp
//
//  Created by Rashmi Singh on 4/28/15.
//  Copyright (c) 2015 WhiteSky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nsUserDefaultsDataTextField:UITextField!
  @IBOutlet weak var keychainDataTextField:UITextField!
  @IBOutlet weak var nsFileCoordinatorsDataTextField:UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func shareUsingNSUserDefaultsTapped ( sender :AnyObject ){
    
    let sharedData = [dataKey :nsUserDefaultsDataTextField.text]
    let userDefault = NSUserDefaults(suiteName: appGroup)
    userDefault!.setObject(sharedData, forKey: keyIdentifier)
    userDefault!.synchronize()
  }
  
  @IBAction func shareUsingNSFileCoordinatorTapped ( sender :AnyObject ){
    
    if let dataStr = nsFileCoordinatorsDataTextField.text,  let dataToWrite = dataStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) {
      ShareDataNsFileCoordinator().writeData( dataToWrite)
    }
  }
  
  @IBAction func shareUsingKeychainAccessTapped ( sender :AnyObject ){
    
    let keyChainItem = KeychainItemWrapper(identifier: keyIdentifier, accessGroup: keyChainAccessGroup)
    // keyChainItem.setObject( kCFBooleanTrue, forKey: NSString(format: kSecAttrAccessibleAfterFirstUnlock)  )
    keyChainItem.setObject( keychainDataTextField.text, forKey: NSString(format: kSecValueData)  )
  }
}

