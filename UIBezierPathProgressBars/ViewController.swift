//
//  ViewController.swift
//  UIBezierPathProgressBars
//
//  Created by Fábio Salata on 19/05/20.
//  Copyright © 2020 Fábio Salata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var horizontalProgressBar: HorizontalProgressBar!
	@IBOutlet weak var circularProgressBar: CircularProgressBar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		slider.addTarget(self, action: #selector(sliderValueChanged(sender:)), for: .valueChanged)
	}
	
	@objc func sliderValueChanged(sender: UISlider) {
		horizontalProgressBar.progress = sender.value
		circularProgressBar.progress = sender.value
	}
}

