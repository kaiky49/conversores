//
//  HomeViewController.swift
//  conversores
//
//  Created by kaiky  on 27/12/22.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var topView: UIView!

  @IBOutlet weak var TitleLabel: UILabel!
  //lbUnit
  @IBOutlet weak var nextButton: UIButton!
  //showNext
  @IBOutlet weak var ValueTextField: UITextField!
  //tfValue
  @IBOutlet weak var fristButton: UIButton!
  //btUnit1
  @IBOutlet weak var secondButton: UIButton!
  //btUnity2
  @IBOutlet weak var resultLabel: UILabel!
  //lbResult
  @IBOutlet weak var resultTextLabel: UILabel!
  //lbResultUnit
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resultTextLabel.isHidden = true
    // Do any additional setup after loading the view.
  }


  @IBAction func showNextButton(_ sender: UIButton) {
    switch  TitleLabel.text! {
    case "Temperatura":
        TitleLabel.text = "Peso"
        fristButton.setTitle("Kilograma", for: .normal)
        secondButton.setTitle("Libra", for: .normal)
    case "Peso":
      TitleLabel.text = "Moeda"
      fristButton.setTitle("Real", for: .normal)
      secondButton.setTitle("Dolar", for: .normal)
    case "Moeda":
      TitleLabel.text = "Distancia"
      fristButton.setTitle("Metro", for: .normal)
      secondButton.setTitle("Kilometro", for: .normal)
    default:
      TitleLabel.text = "Temperatura"
      fristButton.setTitle("Celsius", for: .normal)
      secondButton.setTitle("Farenheint", for: .normal)
    }
    resultTextLabel.isHidden = false
    convert(nil)
  }

  
  @IBAction func convert(_ sender: UIButton?){
    if let sender = sender {
      if sender == fristButton {
        secondButton.alpha = 0.5
      } else {
        fristButton.alpha = 0.5
    }
      sender.alpha = 1.0
  }
    
    switch  TitleLabel.text! {
      case "Temperatura":
        calcTemperature()
      case "Peso":
        calcWeight()
      case "Moeda":
        calcCurrency()
      default:
        calcDistance()
        }
    view.endEditing(true)
    let result = Double(resultLabel.text!)!
    resultLabel.text = String(format: "%.2f", result)
  }
  
  func calcTemperature() {
    guard let temperature = Double(ValueTextField.text!) else { return }
    if fristButton.alpha == 1.0 {
      resultTextLabel.text = "Farenheint"
      resultLabel.text = String(temperature * 1.8 + 32.0)
    } else {
      resultTextLabel.text = "celsius"
      resultLabel.text = String((temperature - 32.0) / 1.8)
    }
  }
  
   func calcWeight() {
     guard let weight = Double(ValueTextField.text!) else { return }
     if fristButton.alpha == 1.0 {
       resultTextLabel.text = "Libra"
       resultLabel.text = String(weight / 2.2046 )
     } else {
       resultTextLabel.text = "Kilograma"
       resultLabel.text = String(weight * 2.2046)
     }

  }
  
  func calcCurrency() {
    guard let currency = Double(ValueTextField.text!) else { return }
    if fristButton.alpha == 1.0 {
      resultTextLabel.text = "Dolar"
      resultLabel.text = String(currency / 5.2)
    } else {
      resultTextLabel.text = "Real"
      resultLabel.text = String(currency * 5.2)
    }
  }
  
  func calcDistance() {
    guard let distance = Double(ValueTextField.text!) else { return }
    if fristButton.alpha == 1.0 {
      resultTextLabel.text = "kilometro"
      resultLabel.text = String(distance / 1000.0)
    } else {
      resultTextLabel.text = "Metro"
      resultLabel.text = String(distance * 1000.0)

    }
  }
}
