//
//  TextNode.swift
//
//  Created by Zach McGaughey on 6/1/18.
//  Copyright © 2018 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit
import MaterialComponents
import UIKit

class TextNode: ASTextNode {

  var paddingInsets: UIEdgeInsets? {
    didSet { setNeedsLayout() }
  }

  private static let defaultFont = MDCTypography.body1Font()
  private static let defaultFontColor = UIColor.black
  private static var defaultParagraphStyle: NSMutableParagraphStyle {
    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = .natural
    return paragraph
  }

  private var customAttributes: [NSAttributedString.Key: Any] = [
    .font: TextNode.defaultFont,
    .foregroundColor: TextNode.defaultFontColor,
    .paragraphStyle: TextNode.defaultParagraphStyle
  ]

  var font: UIFont {
    get {
      return customAttributes[.font] as? UIFont ?? TextNode.defaultFont
    }
    set {
      customAttributes[.font] = newValue
      reloadAttributedString()
    }
  }

  var textColor: UIColor {
    get {
      return customAttributes[.foregroundColor] as? UIColor ?? TextNode.defaultFontColor
    }
    set {
      customAttributes[.foregroundColor] = newValue
      reloadAttributedString()
    }
  }

  var text: String? {
    get {
      return attributedText?.string
    }
    set {
      if let newValue = newValue {
        attributedText = NSAttributedString(string: newValue, attributes: customAttributes)
      } else {
        attributedText = nil
      }
    }
  }

  var lineHeightMultiple: CGFloat {
    get {
      return paragraphStyle.lineHeightMultiple
    }
    set {
      let paragraph = self.paragraphStyle
      paragraph.lineHeightMultiple = newValue
      paragraphStyle = paragraph
    }
  }

  var alignment: NSTextAlignment {
    get {
      return paragraphStyle.alignment
    }
    set {
      let paragraph = self.paragraphStyle
      paragraph.alignment = newValue
      paragraphStyle = paragraph
    }
  }

  private var paragraphStyle: NSMutableParagraphStyle {
    get {
      let paragraph = customAttributes[.paragraphStyle] as? NSParagraphStyle ?? NSParagraphStyle()
      return paragraph.mutableCopy() as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
    set {
      customAttributes[.paragraphStyle] = newValue
      reloadAttributedString()
    }
  }

  private func reloadAttributedString() {
    let text = self.text
    self.text = text
  }
}
