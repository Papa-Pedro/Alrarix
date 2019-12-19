//
//  ViewController.swift
//  Multithreading
//
//  Created by Tim Ferens on 18.12.2019.
//  Copyright © 2019 Tim Ferens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var tempFeelsLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!

    @IBOutlet weak var activityIndicatop: UIActivityIndicatorView!
    
    @IBAction func getWeather(_ sender: Any) {
        
        activityIndicatop.startAnimating()
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=499099&APPID=1b05683bb146bfc6b7a19237b48b9c64") //берем страницу
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in //что бы получить что либо(загрузить)
            guard let data = data else { return } //есть ли данные
            guard error == nil else { return }//проверка на наличие ошибок
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return } //преобразуем json в объект Foundation
            
            guard let main = json!["main"] as? [String: Any] else { return } //вытаскиваем
            guard let weather = main["temp"] as? Double else { return }
            guard let weatherFeels = main["feels_like"] as? Double else { return }
            
            guard let wind = json!["wind"] as? [String: Any] else {return}
            guard let speed = wind["speed"] as? Double else { return}
            
            DispatchQueue.main.async { //ставим в очередь мейн асинхроно
                self.tempLabel.text = String("\(Int(Double(weather) - 273.15)) градуса")
                self.tempFeelsLabel.text = String("\(Int(Double(weatherFeels) - 273.15)) градуса")
                self.windLabel.text = String("\(Int(speed)) m/s")
                self.activityIndicatop.stopAnimating()

            }
        }.resume() //сброс внутренего состояния
        
    }

}

