//
//  ViewController.swift
//  Calculator
//
//  Created by Zhaonian Luan on 6/30/19.
//  Copyright © 2019 Zhaonian Luan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var displayLabel: UILabel!

  private var isFinishedTyping: Bool = true

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func numberButtonPressed(_ sender: UIButton) {
    if let numValue = sender.currentTitle {
      if isFinishedTyping {
        displayLabel.text = numValue
        isFinishedTyping = false
      } else {
        if numValue == "." {
          let isInt = floor(Double(displayLabel.text!)!) == Double(displayLabel.text!)
          if !isInt {
            return
          }
        }
        displayLabel.text = displayLabel.text! + numValue
      }
    }
  }

  @IBAction func calcButtonPressed(_ sender: UIButton) {
    isFinishedTyping = true
//    let number = Double(displayLabel.text!)!
    guard let number = Double(displayLabel.text!) else {
      fatalError("")
    }

    if let calcMethod = sender.currentTitle {
      if calcMethod == "+/-" {
        displayLabel.text = String(number * -1)
      } else if calcMethod == "AC" {
        displayLabel.text = "0"
      } else if calcMethod == "%" {
        displayLabel.text = String(number * 0.01)
      }
    }
  }
}
