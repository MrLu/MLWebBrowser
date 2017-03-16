//
//  String+util.swift
//  MLWebBrowser
//
//  Created by Mrlu-bjhl on 16/03/2017.
//  Copyright © 2017 Mrlu. All rights reserved.
//

import Foundation


extension String {
    // url encode
    var urlEncode:String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    // url decode
    var urlDecode :String? {
        return self.removingPercentEncoding
    }
}
