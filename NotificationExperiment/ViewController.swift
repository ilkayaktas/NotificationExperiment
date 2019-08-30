//
//  ViewController.swift
//  NotificationExperiment
//
//  Created by İlkay Aktaş on 26.08.2019.
//  Copyright © 2019 İlkay Aktaş. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func scheduleNotification(dateComponents: DateComponents){
        let manager = LocalNotificationManager()
        manager.notifications = [
            Notification(id: "reminder-\(dateComponents)",
                title: "Reminder \(dateComponents.hour!):\(dateComponents.minute!)",
                message: "Do not forget something!",
                datetime: dateComponents)
        ]
        
        manager.schedule()
    }
    
    @IBAction func onSetAlarmClicked(_ sender: Any) {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date)
        scheduleNotification(dateComponents: dateComponents)
        
    }
    
    func getLocaleTime(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let result = formatter.string(from: date)
        return result
    }
    

}

