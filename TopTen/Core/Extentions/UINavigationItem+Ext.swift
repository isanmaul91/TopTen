//
//  UINavigationItem+Ext.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

extension UINavigationItem {
   func enableMultilineTitle() {
      setValue(true, forKey: "__largeTitleTwoLineMode")
   }
}
