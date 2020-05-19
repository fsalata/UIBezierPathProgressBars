//
//  CircularProgressBar.swift
//  UIBezierPathProgressBars
//
//  Created by Fábio Salata on 19/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressBar: UIView {

	@IBInspectable var color: UIColor? = .gray
	@IBInspectable var ringWidth: CGFloat = 5
	
	private let backgroundMask = CAShapeLayer()
	private let progressLayer = CAShapeLayer()
	
	var progress: Float = 0 {
		didSet {
			setNeedsDisplay()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupLayers()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupLayers()
	}
	
	private func setupLayers() {
		backgroundMask.lineWidth = ringWidth
		backgroundMask.fillColor = nil
		backgroundMask.strokeColor = UIColor.black.cgColor
		layer.mask = backgroundMask
		
		progressLayer.lineWidth = ringWidth
		progressLayer.fillColor = nil
		progressLayer.lineCap = .round
		layer.addSublayer(progressLayer)
		layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)
	}
	
	override func draw(_ rect: CGRect) {
		let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: ringWidth / 2, dy: ringWidth / 2)).cgPath
		
		backgroundMask.path = circlePath
		
		progressLayer.path = circlePath
		progressLayer.strokeStart = 0
		progressLayer.strokeEnd = CGFloat(progress)
		progressLayer.strokeColor = color?.cgColor
	}

}
