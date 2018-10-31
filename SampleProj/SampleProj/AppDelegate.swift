//
//  AppDelegate.swift
//  SampleProj
//
//  Created by Yogesh on 10/22/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("val is  \(maximizingDiff(arr: [7,6, 4, 2,1,0], itemToSearch: 4))")
        print("balanced brakets \(checkForBalncedBracket(str: "{[()]}"))")

         print("System up time is \(ProcessInfo.processInfo.systemUptime)")
        NotificationCenter.default.addObserver(self, selector: #selector(timeChangedNotification), name: NSNotification.Name.NSSystemClockDidChange, object: self)
        return true
    }

    @objc func timeChangedNotification(){
        print("Device time has been changed...")
    }

    func maximizingDiff( arr : [Int] , itemToSearch : Int) -> Int{
        if let index = arr.index(of: itemToSearch) {
            var leftNumber  = 0
            var rightNumber = 0
            if index > 0 {
                for i in 0...(index-1) {
                    if arr[i] > itemToSearch {
                        leftNumber = leftNumber + 1
                    }
                }
            }
            if (index+1) < arr.count  {
                for i in (index + 1)...arr.count - 1{
                    if arr[i] < itemToSearch {
                        rightNumber = rightNumber + 1
                    }
                }
            }
            return  abs(leftNumber  - rightNumber)
        }
        return 0
    }

    func checkForBalncedBracket( str : String) -> Bool {
        var arr = [Character]()
        for char in str {
            if char == "{" || char == "[" || char == "(" {
                arr.insert(char, at: 0)
            } else{
                var val : Character = char
                val   = (char == ")" ) ? "(" : ((char == "]") ? "[" : "{")
                if !arr.isEmpty , arr.contains(val) {
                    if let intVal = arr.lastIndex(of: val) , intVal >= 0 {
                        arr.remove(at: intVal)
                    }
                } else{
                    arr.insert(char, at: 0)
                }
            }
        }
        return arr.isEmpty
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        DBManager.sharedInstance.saveContext()
    }
}

