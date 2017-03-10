//
//  ViewController.swift
//  MLWebBrowser
//
//  Created by Mrlu-bjhl on 01/03/2017.
//  Copyright © 2017 Mrlu. All rights reserved.
//

import UIKit
import SnapKit

class MainSearchControl: UIView {
    
    lazy var searchBar:UIView = {
        var textField = UITextField()
        textField.placeholder = "搜索或输入网址"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor.black
        textField.keyboardType = .webSearch
        return textField
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "ntp_google_search_box").resizableImage(withCapInsets: UIEdgeInsetsMake(2, 2, 2, 2)))
        addSubview(backgroundImageView)
        addSubview(searchBar)
        backgroundImageView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        searchBar.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(10)
            maker.bottom.equalTo(0)
            maker.top.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


class MainViewController: UIViewController,UIScrollViewDelegate {
    
    lazy var searchBar:MainSearchControl = {
        var searchBar = MainSearchControl()
        return searchBar
    }();
    
    lazy var scrollView:UIScrollView = {
        var scrollView = UIScrollView(frame:self.view.bounds)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var container:UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var headView:UIView = {
        var headView = UIView()
        var logoView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        headView.addSubview(#imageLiteral(resourceName: "logo"))
        return headView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(container)

        container.addSubview(headView)
        headView.addSubview(searchBar)
        
        container.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).offset(250)
        }
        
        headView.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.height.equalTo(300)
        }
        
        searchBar.snp.makeConstraints { (maker) in
            maker.left.equalTo(30)
            maker.right.equalTo(-30)
            maker.bottom.equalTo(0)
            maker.height.equalTo(50)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

