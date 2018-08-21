//
//  String+AddText.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/21/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
