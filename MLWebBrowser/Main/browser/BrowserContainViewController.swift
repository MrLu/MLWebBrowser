//
//  BrowserContainViewController.swift
//  MLWebBrowser
//
//  Created by Mrlu-bjhl on 09/03/2017.
//  Copyright © 2017 Mrlu. All rights reserved.
//

import UIKit
import APIKit
class BrowserContainViewController: UIViewController {
    
    var searchContent:String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        view.backgroundColor = UIColor.white
        let webVC = genrateWebViewController()
        webVC.url = getBaiduSearchApi(key: (searchContent == nil ? "" : searchContent!))
        self.addChildViewController(webVC)
        view.addSubview(webVC.view)
    }

    func genrateWebViewController() -> WebViewController {
        let webVC = WebViewController();
        return webVC
    }
    
    func getBaiduSearchApi(key:String) -> URL? {
        var key = key
        key = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if (URL(string: key)?.scheme != nil) {
            return URL(string: key)
        }
        let urlStr = "https://m.baidu.com/s?from=844b&vit=fps&word=\(key)"
        return URL(string: urlStr)
    }
}
