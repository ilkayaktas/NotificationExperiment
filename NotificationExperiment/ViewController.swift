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
                title: "Reminder \(dateComponents)",
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
    

/*
    func runOnTimer(){
        let timer = Timer(fireAt: dateComp.date!, interval: 0, target: self, selector: #selector(updateNotification), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func updateNotification(){
        let newDateComponent = getNextHour()
        let manager = LocalNotificationManager()
        manager.notifications = [
            Notification(id: "reminder-\(dateComp.date!)",
                         title: "Reminder \(dateComp.date!)",
                         message: "Do not forget something!",
                         datetime: newDateComponent)
        ]
        
        manager.schedule()
        
        print("New notification is set to \(newDateComponent.date!)")

    }
    
    func getNextHour() -> DateComponents {
        let now = Date()
        
        let year = Calendar.current.component(.year, from: now)
        let month = Calendar.current.component(.month, from: now)
        let day = Calendar.current.component(.day, from: now)
        let hour = Calendar.current.component(.hour, from: now)
        let minute = Calendar.current.component(.minute, from: now)

        return DateComponents(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute+1)
    }

*/
}

