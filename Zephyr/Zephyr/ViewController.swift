//
//  ViewController.swift
//  Zephyr
//
//  Created by Tanish on 09/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var gradientView: UIView!
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherIconView: UIImageView!
    
    @IBOutlet weak var forecastStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(snapshot: WeatherProvider.sample())
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyGradient()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateIcon()
    }
    
    
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemTeal.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)

        gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    func configure(snapshot: WeatherSnapshot) {
        cityLabel.text = snapshot.city
        temperatureLabel.text = snapshot.temperature
        weatherIconView.image = UIImage(systemName: snapshot.symbolName)

        buildForecastRow(snapshot.forecast)
    }

    func buildForecastRow(_ items: [ForecastItem]) {
        forecastStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for item in items {
            let vStack = UIStackView()
            vStack.axis = .vertical
            vStack.spacing = 4
            vStack.alignment = .center

            let icon = UIImageView(image: UIImage(systemName: item.symbolName))
            icon.tintColor = .white

            let temp = UILabel()
            temp.text = item.temp
            temp.textColor = .white
            temp.font = UIFont.systemFont(ofSize: 14)

            vStack.addArrangedSubview(icon)
            vStack.addArrangedSubview(temp)
            forecastStackView.addArrangedSubview(vStack)
        }
    }

    func animateIcon() {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.byValue = -6
        animation.duration = 2.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        weatherIconView.layer.add(animation, forKey: "float")
    }




}

