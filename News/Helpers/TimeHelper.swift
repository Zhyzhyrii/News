//
//  TimeHelper.swift
//  News
//
//  Created by Игорь on 04.02.2020.
//  Copyright © 2020 Igor Zhyzhyrii. All rights reserved.
//
class TimeHelper {
 
    static func convertTimeToSeconds(hours: Int, minutes: Int, seconds: Int) -> Int {
        return hours * 3600 + minutes * 60 + seconds
    }
    
    static func convertSecondsToTime(seconds: Int) -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        return (hours, minutes, seconds)
    }
    
}
