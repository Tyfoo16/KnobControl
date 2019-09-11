//
//  Knob.swift
//  KnobDemo
//
//  Created by Seto on 06/09/2019.
//  Copyright © 2019 vandetta. All rights reserved.
//

import UIKit

@IBDesignable public class Knob: UIControl {
    
    public var minimumValue: Float = 0
    
    public var maximumValue: Float = 1
    
    public var isContinuous = true
    
    public private (set) var value: Float = 0
    
    private let renderer = KnobRenderer()
    
    @IBInspectable public var lineWidth: CGFloat {
        get { return renderer.lineWidth }
        set { renderer.lineWidth = newValue }
    }
    
    public var startAngle: CGFloat {
        get { return renderer.startAngle }
        set { renderer.startAngle = newValue }
    }
    
    public var endAngle: CGFloat {
        get { return renderer.endAngle }
        set { renderer.endAngle = newValue }
    }
    
    @IBInspectable public var pointerLength: CGFloat {
        get { return renderer.pointerLength }
        set { renderer.pointerLength = newValue }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .blue
        renderer.updateBounds(bounds)
        renderer.color = tintColor
        renderer.setPointerAngle(renderer.startAngle, animated: false)
        
        layer.addSublayer(renderer.trackLayer)
        layer.addSublayer(renderer.pointerLayer)
        
        let gestureRecognizer = RotationGestureRecognizer(target: self, action: #selector(Knob.handleGesture(_:)))
        addGestureRecognizer(gestureRecognizer)
    }
    
    public func setValue(_ newValue: Float, animated: Bool = false) {
        value = min(maximumValue, max(minimumValue, newValue))
        
        let angleRange = endAngle - startAngle
        let valueRange = maximumValue - minimumValue
        let angleValue = CGFloat(value - minimumValue) / CGFloat(valueRange) * angleRange + startAngle
        renderer.setPointerAngle(angleValue, animated: animated)
    }
    
    @objc private func handleGesture(_ gesture: RotationGestureRecognizer) {
        // 1
        let midPointAngle = (2 * CGFloat(Double.pi) + startAngle - endAngle) / 2 + endAngle
        // 2
        var boundedAngle = gesture.touchAngle
        if boundedAngle > midPointAngle {
            boundedAngle -= 2 * CGFloat(Double.pi)
        } else if boundedAngle < (midPointAngle - 2 * CGFloat(Double.pi)) {
            boundedAngle -= 2 * CGFloat(Double.pi)
        }
        
        // 3
        boundedAngle = min(endAngle, max(startAngle, boundedAngle))
        
        // 4
        let angleRange = endAngle - startAngle
        let valueRange = maximumValue - minimumValue
        let angleValue = Float(boundedAngle - startAngle) / Float(angleRange) * valueRange + minimumValue
        
        // 5
        setValue(angleValue)
        
        if isContinuous {
            sendActions(for: .valueChanged)
        } else {
            if gesture.state == .ended || gesture.state == .cancelled {
                sendActions(for: .valueChanged)
            }
        }
    }
}

extension Knob {
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        renderer.updateBounds(bounds)
    }
}
