//
//  ViewExtensions.swift
//  CaptureProtectionView
//
//  Created by Phanith Ny on 11/11/25.
//

fileprivate let magicArray = ["Mask", "Update", "disable"]

#if canImport(UIKit)
import UIKit

extension UIView {
  public final func hideFromScreenshot(_ hidden: Bool) {
    let propertyString: String = magicArray.reversed().joined()
    
    guard layer.responds(to: NSSelectorFromString(propertyString)) else {
      return
    }
    
    switch hidden {
    case true:
      let hideFlag = (1 << 1) | (1 << 4)
      layer.setValue(NSNumber(value: hideFlag), forKey: propertyString)
      
    case false:
      layer.setValue(NSNumber(value: 0), forKey: propertyString)
    }
  }
}
#endif

#if canImport(AppKit)
import AppKit
extension NSView {
  public final func hideFromScreenshot(_ hidden: Bool) {
    let propertyString: String = magicArray.reversed().joined()
    
    guard let layer, layer.responds(to: NSSelectorFromString(propertyString)) else {
      return
    }
    
    switch hidden {
    case true:
      let hideFlag = (1 << 1) | (1 << 4)
      layer.setValue(NSNumber(value: hideFlag), forKey: propertyString)
      
    case false:
      layer.setValue(NSNumber(value: 0), forKey: propertyString)
    }
  }
}
#endif
