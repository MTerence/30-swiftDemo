//
//  FetchSubString.swift
//  ColorGradient
//
//  Created by Ternence on 2019/2/22.
//  Copyright © 2019 Ternence. All rights reserved.
//

import Foundation

extension String {
    subscript (r: Range<Int>) -> String{
        
        get{
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return String(self[startIndex..<endIndex])
            
            
        }
    }
}
