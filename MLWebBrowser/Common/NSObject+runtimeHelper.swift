//
//  NSObject+runtimeHelper.swift
//  MLWebBrowser
//
//  Created by Mrlu-bjhl on 06/04/2017.
//  Copyright © 2017 Mrlu. All rights reserved.
//

import Foundation

extension NSObject {

    func getMethodListAndProperties(cls:AnyClass) -> Void {
        getMethodList(cls: cls)
        getMethodProperties(cls: cls)
    }
    
    func getMethodList(cls:AnyClass) -> Void  {
        //方法
        var methodCount:UInt32 = 0
        let methodList = class_copyMethodList(cls, &methodCount)
        if (methodList != nil) {
            //打印方法
            for i in 0..<Int(methodCount) {
                let method:Method! = methodList![i]
//                print(String(cString:method_getTypeEncoding(method)))
                print(String(_sel:method_getName(method)))
            }
            free(methodList)
        }
    }
    
    func getMethodProperties(cls:AnyClass) -> Void {
        //属性
        var propertiesCount:UInt32 = 0
        let propertiesList = class_copyPropertyList(cls, &propertiesCount)
        if (propertiesList != nil) {
            //打印属性
            for i in 0..<Int(propertiesCount) {
                let property:objc_property_t! = propertiesList![i]
                print(String(cString:property_getName(property)))
//                print(String(cString:property_getAttributes(property)))
            }
            free(propertiesList)
        }
    }
}
