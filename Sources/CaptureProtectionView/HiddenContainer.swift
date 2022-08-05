//
//  HiddenContainerRecognizer.swift
//  WingLandingPage
//
//  Created by Phanith on 4/8/22.
//

import UIKit

/// Recognize view, which can be hidden before system screenshot event did triggered, depend on `iOS vesrion`
struct HiddenContainer {
  
  // MARK: - Nested Types
  
  private enum Error: Swift.Error {
    case unsupportediOSVersion(version: Float)
    case hiddenContainerNotFound(_ containerName: String)
  }
  
  // MARK: - Internal Methods
  
  func getHiddenContainer(from view: UIView) throws -> UIView {
    let containerName = try getHiddenContainerTypeInStringRepresentation()
    let containers = view.subviews.filter { subview in
      return type(of: subview).description() == containerName
    }
    
    guard let container = containers.first else {
      throw Error.hiddenContainerNotFound(containerName)
    }
    
    return container
  }
  
  func getHiddenContainerTypeInStringRepresentation() throws -> String {
    
    if #available(iOS 15, *) {
      return "_UITextLayoutCanvasView"
    }
    
    if #available(iOS 14, *) {
      return "_UITextFieldCanvasView"
    }
    
    if #available(iOS 13, *) {
      return "_UITextFieldCanvasView"
    }
    
    if #available(iOS 12, *) {
      return "_UITextFieldContentView"
    }
    
    let currentIOSVersion = (UIDevice.current.systemVersion as NSString).floatValue
    throw Error.unsupportediOSVersion(version: currentIOSVersion)
  }
  
}
