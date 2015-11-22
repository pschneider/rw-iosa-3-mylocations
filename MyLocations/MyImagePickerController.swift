//
//  MyImagePickerController.swift
//  MyLocations
//
//  Created by Patrick Schneider on 22/11/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

// used because changing status bar on vc embedded in navigation vc's does not work
class MyImagePickerController: UIImagePickerController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
