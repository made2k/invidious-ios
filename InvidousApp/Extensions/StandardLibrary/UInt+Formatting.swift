//
//  UInt+Formatting.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/11/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Foundation

extension UInt {

  /**
   Converts a large number into a user readable format
   by adding a letter suffix to represent the unit.

   - Author:
   Luca laco (https://stackoverflow.com/questions/18267211/ios-convert-large-numbers-to-smaller-format)
   */
  var suffixDescription: String {

    if self < 1000 {
      return "\(self)";
    }

    let exp = Int(log10(Double(self)) / 3.0)

    let units = ["K", "M", "B", "T", "Q", "Qu"]

    let rounded = round(10 * Double(self) / pow(1000.0, Double(exp))) / 10

    if exp <= 1 {
      return "\(Int(rounded))\(units[exp - 1])"
    }

    return "\(rounded)\(units[exp - 1])"
  }

}
