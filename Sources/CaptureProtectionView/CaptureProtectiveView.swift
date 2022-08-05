//
//  CaptureProtectiveView.swift
//  WingLandingPage
//
//  Created by Phanith on 4/8/22.
//

import UIKit

public protocol CaptureProtectiveView {
  associatedtype Content
  associatedtype ProtectiveContainer
  
  var content: Content { get set }
  var container: ProtectiveContainer { get set }
  
  func replaceContent(_ newContent: Content)
  func hideContentsFromScreenCapture()
  func showContentsInScreenCapture()
}

extension CaptureProtectiveView where Self: CaptureProtectiveContainer {
  func hideContentsFromScreenCapture() {
    showContentsInScreenCapture()
  }
  
  func showContentsInScreenCapture() {
    showContentsInScreenCapture()
  }
}
