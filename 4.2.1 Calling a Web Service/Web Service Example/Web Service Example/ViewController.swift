//
//  ViewController.swift
//  Web Service Example
//
//  Created by Ammi Tan on 3/21/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var forecastLabel: UILabel!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        self.forecastLabel.text = ""
        
        //instantiate a gray Activity Indicator View
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        //add the activity to the ViewController's view
        view.addSubview(activityIndicatorView)
        //position the Activity Indicator View in the center of the view
        activityIndicatorView.center = view.center
        //tell the Activity Indicator View to begin animating
        activityIndicatorView.startAnimating()
        
        
        let manager = AFHTTPSessionManager()
        
        manager.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=Houston&mode=json&units=metric&cnt=1&appid=e6e3904fe791185b6fb072da91901ab1",
            
            parameters: nil,
            progress: nil,
            
            success: { (operation: URLSessionDataTask, responseObject:Any?) in
            
                if let responseObject = responseObject {
                    print("Response: " + (responseObject as AnyObject).description)
                

                if let listOfDays = (responseObject as AnyObject)["list"] as? [AnyObject] {
                    if let tomorrow = listOfDays[0] as? [String:AnyObject] {
                        if let tomorrowsWeather = tomorrow["weather"] as? [AnyObject] {
                            if let firstWeatherOfDay = tomorrowsWeather[0] as? [String:AnyObject] {
                                if let forecast = firstWeatherOfDay["description"] as? String {
                                    self.forecastLabel.text = forecast

                                }
                            }
                        }
                    }
                }
            }
                
            }) { (operation:URLSessionDataTask?, error:Error) in
                print("Error: " + error.localizedDescription)
            }
    
            activityIndicatorView.removeFromSuperview()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 //   forecastLabel.text = forecast

}

