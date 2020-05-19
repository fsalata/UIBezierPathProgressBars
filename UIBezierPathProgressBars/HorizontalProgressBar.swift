//
//  HorizontalProgressBar.swift
//  UIBezierPathProgressBars
//
//  Created by Fábio Salata on 19/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import UIKit

@IBDesignable
class HorizontalProgressBar: UIView {
	@IBInspectable var color: UIColor? = .gray
	
	private let progressLayer = CALayer()
	
	var progress: Float = 0 {
		didSet {
			setNeedsDisplay()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		layer.addSublayer(progressLayer)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		layer.addSublayer(progressLayer)
	}
	
	override func draw(_ rect: CGRect) {
		let backgroundMask = CAShapeLayer()
		backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
		layer.mask = backgroundMask
		
		let progressRect = CGRect(origin: .zero, size: .init(width: rect.width * CGFloat(progress),
															 height: rect.height))
		progressLayer.frame = progressRect
		
		layer.addSublayer(progressLayer)
		progressLayer.backgroundColor = color?.cgColor
		
	}

}
