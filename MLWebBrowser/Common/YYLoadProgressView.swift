//
//  YYLoadProgressView.swift
//  Pro_YYJapDicFile_swift
//
//  Created by Mrlu-bjhl on 16/9/1.
//  Copyright © 2016年 www.Mrlu.com. All rights reserved.
//

import UIKit

let IndicatorSize = CGSize(width: 0 , height: 0)

enum YYLoadProgressViewStyle:Int {
    case large
    case middle
    case small
}

class YYLoadProgressView: UIView {
    
    var loadProgressViewStyle: YYLoadProgressViewStyle = .middle // default is .Middle
    
    var color: UIColor? = UIColor(white: 0.6,alpha: 0.8)
    
    fileprivate let space: CGFloat = 5
    
    fileprivate let instanceDelay: CFTimeInterval = 0.2
    fileprivate let instanceCount: Int = 3
    fileprivate var instanceSize = CGSize.zero
    
    convenience init(loadProgressViewStyle style: YYLoadProgressViewStyle) {
        self.init(frame: CGRect(origin: CGPoint.zero, size: IndicatorSize))
        self.loadProgressViewStyle = style
        switch style {
        case .large:
            instanceSize = CGSize(width: 20, height: 20)
            break
        case .small:
            instanceSize = CGSize(width: 15, height: 15)
            break
        case .middle:
            instanceSize = CGSize(width: 18, height: 18)
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.replicatorLayer.instanceDelay = instanceDelay
        self.replicatorLayer.frame = bounds
        self.replicatorLayer.backgroundColor = UIColor.red.cgColor
        self.layer.addSublayer(self.replicatorLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var replicatorLayer:CAReplicatorLayer = {
        let replicatorLayer:CAReplicatorLayer = CAReplicatorLayer()
        return replicatorLayer
    }()
    
    func startAnimating() {
        
        let bar = CALayer()
        bar.bounds = CGRect(origin: CGPoint.zero, size: instanceSize)
        bar.opacity = 0
        bar.cornerRadius = 2.0
        bar.backgroundColor = color?.cgColor
        let x = (bar.bounds.size.width * CGFloat(instanceCount) + space * CGFloat(instanceCount - 1))/2 - IndicatorSize.width/2 - bar.bounds.size.width/2
        let y = IndicatorSize.height/2
        bar.position = CGPoint(x:-x  , y: y)
        
        let move = CABasicAnimation(keyPath: "opacity")
        move.toValue = 1
        move.duration = 0.4
        move.autoreverses = true
        move.repeatCount = Float.infinity
        move.isRemovedOnCompletion = false;
        bar.add(move, forKey: nil)
        
        let scale = CABasicAnimation(keyPath: "transform.scale.y")
        scale.toValue = 1.4
        scale.duration = 0.4
        scale.autoreverses = true
        scale.repeatCount = Float.infinity
        scale.isRemovedOnCompletion = false;
        bar.add(scale, forKey: nil)
        
        let offsetx:CGFloat = bar.bounds.size.width + space;
        self.replicatorLayer.instanceTransform = CATransform3DMakeTranslation(offsetx, 0.0, 0.0)
        replicatorLayer.instanceCount = instanceCount;
        self.replicatorLayer.addSublayer(bar)
    }
    
    func stopAnimating() {
        self.removeFromSuperview()
        self.replicatorLayer.removeFromSuperlayer()
    }
    
    func isAnimating() -> Bool {
        if self.replicatorLayer.sublayers == nil {
            return false
        }
        return true
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let newSuperview = superview
        if newSuperview != nil {
            let superCenter:CGPoint = CGPoint(x: newSuperview!.frame.midX, y: newSuperview!.frame.midY)
            self.center = superCenter
        }
    }
    
    public class func startAnimating(view:UIView?, loadProgressViewStyle aloadProgressViewStyle:YYLoadProgressViewStyle = .small) -> Void {
        let loadProgressView:YYLoadProgressView = YYLoadProgressView(loadProgressViewStyle: aloadProgressViewStyle)
        if view != nil {
            view!.addSubview(loadProgressView)
        } else {
            UIApplication.shared.keyWindow!.addSubview(loadProgressView)
        }
        loadProgressView.startAnimating()
    }
    
    public class func stopAnimating(view:UIView?) -> Void {
        if view != nil {
            for item in view!.subviews {
                if item is YYLoadProgressView {
                    (item as! YYLoadProgressView).stopAnimating()
                }
            }
        } else {
            for item in UIApplication.shared.keyWindow!.subviews {
                if item is YYLoadProgressView {
                    (item as! YYLoadProgressView).stopAnimating()
                }
            }
        }
    }
}
