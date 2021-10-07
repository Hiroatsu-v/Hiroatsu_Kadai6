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

    private var randomNumber = ViewController.makeRandomNumber()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(randomNumber)
    }

    @IBAction private func checkButton(_ sender: UIButton) {
        let sliderValue = Int(slider.value)
        if randomNumber == sliderValue {
            presentAlert(message: "当たり!\nあなたの値:\(sliderValue)")
        } else {
            presentAlert(message: "ハズレ!\nあなたの値:\(sliderValue)")
        }
    }

    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let judgementAction = UIAlertAction(title: "再挑戦", style: .default) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.randomNumber = ViewController.makeRandomNumber()
            strongSelf.numberLabel.text = String(strongSelf.randomNumber)
        }
        alertController.addAction(judgementAction)
        present(alertController, animated: true, completion: nil)
    }

    private static func makeRandomNumber() -> Int {
        Int.random(in: 1...100)
    }
}
