//
//  ViewController.swift
//  Kadai6
//
//  Created by Hiroatsu on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!

    private var randomNumber = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(randomNumber)
    }

    @IBAction private func checkButton(_ sender: UIButton) {
        let sliderValue = Int(slider.value)
        if randomNumber == sliderValue {
            presentAlert(message: "当たり!\nあなたの値:\(sliderValue)")
        }
        presentAlert(message: "ハズレ!\nあなたの値:\(sliderValue)")
    }

    func presentAlert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let judgementAction = UIAlertAction(title: "再挑戦", style: .default) { ( _: UIAlertAction) in
            self.randomNumber = Int.random(in: 1...100)
            self.numberLabel.text = String(self.randomNumber)
        }
        alertController.addAction(judgementAction)
        present(alertController, animated: true, completion: nil)
    }
}
