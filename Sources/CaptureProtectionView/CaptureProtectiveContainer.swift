//
//  CaptureProtectiveContainer.swift
//  WingLandingPage
//
//  Created by Phanith on 4/8/22.
//

import Foundation
import UIKit

public protocol CaptureProtectiveContainer: UIView {
  func replaceContent(_ newContent: UIView)
  func hideContentsFromScreenCapture()
  func showContentsInScreenCapture()
}
