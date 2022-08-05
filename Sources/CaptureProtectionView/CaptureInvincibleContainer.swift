//
//  CaptureInvincibleContainer.swift
//  WingLandingPage
//
//  Created by Phanith on 4/8/22.
//

import UIKit

final class CaptureInvincibleContainer: UITextField {
  
  // MARK: - Private Properties
  
  private let hiddenContainerRecognizer = HiddenContainer()
  private var container: UIView {
    // If hidden container is not found, use self as container.
    (try? hiddenContainerRecognizer.getHiddenContainer(from: self)) ?? self
  }
  
  // MARK: - Internal Properties
  
  /// - View, which will be hidden on screenshots and screen recording
  private(set) var content: UIView
  
  // MARK: - Init / Deinit
  
  public init(content: UIView) {
    self.content = content
    super.init(frame: .zero)
    
    prepareLayouts()
  }
  
  public required init?(coder: NSCoder) {
//    self.content = UIView()
//    super.init(coder: coder)
//
//    prepareLayouts()
    fatalError()
  }
  
  deinit {
    #if DEBUG
    print(type(of: self), " deinit.")
    #endif
  }
  
  public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    guard !isHidden,
          alpha > 0.01,
          frame.contains(point),
          isUserInteractionEnabled else {
            return super.hitTest(point, with: event)
          }
    return self
  }
  
  // MARK: - Layouts
  
  private func prepareLayouts() {
    backgroundColor = .clear
    isUserInteractionEnabled = false
    
    addContent()
  }
  
  private func addContent() {
    container.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    content.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
    content.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    content.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
    content.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
  }
}

// MARK: - ScreenshotInvincibleContainerProtocol

extension CaptureInvincibleContainer: CaptureProtectiveContainer {
  public func replaceContent(_ newContent: UIView) {
    content.removeFromSuperview()
    content = newContent
    addContent()
  }
  
  public func hideContentsFromScreenCapture() {
    isSecureTextEntry = true
  }
  
  public func showContentsInScreenCapture() {
    isSecureTextEntry = false
  }
}
