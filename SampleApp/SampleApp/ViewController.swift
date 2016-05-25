//
//  ViewController.swift
//  SampleApp
//
//  Created by 藤田 衆一 on 2016/04/29.
//  Copyright © 2016年 fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label: UILabel!
	
	@IBOutlet weak var countUpButton: UIButton!
	
	@IBOutlet weak var countDownButton: UIButton!
	
	@IBOutlet weak var countRandomButton: UIButton!
	
	@IBOutlet weak var resetButton: UIButton!
	
	var count: Int = 0
	let textFizz: String = " Fizz"
	let textBuzz: String = " Buzz"
	let textMadness: String = " わああぁあぁああぁぁぁ"
	var textPlus = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let selUp = #selector(countUp)
		let selDown = #selector(countDown)
		let selRandom = #selector(countRandom)
		let selReset = #selector(countReset)
		
		countUpButton.addTarget(self,
		                        action: selUp,
		                        forControlEvents: UIControlEvents.TouchUpInside)
		
		countDownButton.addTarget(self,
		                        action: selDown,
		                        forControlEvents: UIControlEvents.TouchUpInside)
		
		countRandomButton.addTarget(self,
		                            action: selRandom,
		                            forControlEvents: UIControlEvents.TouchUpInside)
		
		resetButton.addTarget(self,
		                      action: selReset,
		                      forControlEvents: UIControlEvents.TouchUpInside)
		
		label.text = "\(count)"
	}
	
	// count events
	func countUp() {
		count += 1
		
		fizzBuzz(count)
		
		label.text = "\(count)" + "\(textPlus)"
	}
	
	func countDown() {
		self.view.backgroundColor = UIColor.blueColor()
		count -= 1
		
		fizzBuzz(count)
		
		label.text = "\(count)" + "\(textPlus)"
	}
	
	func countRandom() {
		self.view.backgroundColor = UIColor.yellowColor()
		count += Int(arc4random_uniform(10))
		
		fizzBuzz(count)
		
		label.text = "\(count)" + "\(textPlus)"
	}
	
	func countReset() {
		self.view.backgroundColor = UIColor.darkGrayColor()
		count = 0
		
		label.text = "\(count)"
	}
	
	// fizzbuzz func
	func fizzBuzz(num: Int) {
		switch (num % 3, num % 5, num % 50) {
		case (_, _, 0):
			textPlus = textMadness
			self.view.backgroundColor = UIColor.redColor()
		case (0, 0, _):
			textPlus = textFizz + textBuzz
			self.view.backgroundColor = UIColor.orangeColor()
		case (0, _, _):
			textPlus = textFizz
			self.view.backgroundColor = UIColor.blueColor()
		case (_, 0, _):
			textPlus = textBuzz
			self.view.backgroundColor = UIColor.greenColor()
		default:
			textPlus = ""
			self.view.backgroundColor = UIColor.darkGrayColor()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}