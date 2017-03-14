//
//  SearchEngineManager.swift
//  MLWebBrowser
//
//  Created by Mrlu-bjhl on 14/03/2017.
//  Copyright © 2017 Mrlu. All rights reserved.
//

import UIKit

enum SearchEngineType {
    case none
    case baidu
    case google
    case sogo
}

class SearchEngine {
    var type:SearchEngineType = .none
    var name:String?
//    var url:NSURL
}

class SearchEngineManager: NSObject {
    var engine:SearchEngine?
    
}
