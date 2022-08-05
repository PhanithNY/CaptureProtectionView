//
//  ScreenshotProtectController.swift
//  WingLandingPage
//
//  Created by Phanith on 4/8/22.
//

import class UIKit.UIView

open class CaptureProtectionView<Content: UIView>: CaptureProtectiveView {
  
  public typealias ProtectiveContainer = CaptureProtectiveContainer
  
  public var content: Content
  
  public lazy var container: ProtectiveContainer = CaptureInvincibleContainer(content: content)
  
  public init(content: Content) {
    self.content = content
  }
  
  public func replaceContent(_ newContent: Content) {
    container.replaceContent(newContent)
  }
  
  public func hideContentsFromScreenCapture() {
    container.hideContentsFromScreenCapture()
  }
  
  public func showContentsInScreenCapture() {
    container.showContentsInScreenCapture()
  }
  
}
