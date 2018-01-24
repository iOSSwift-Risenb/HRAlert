//
//  HRAlertReference.swift
//  HRAlert
//
//  Created by Obgniyum on 2018/1/24.
//

public extension HRAlert {
    
    public class func alert(_ message:String) {
        let time = Float(message.count) / 5.0 * 0.08 + 0.5
        alert(title: nil, message: message, duration: time, then: nil)
    }
    
    public class func alert(_ message:String, _ then:(() -> ())?) {
        alert(title: nil, message: message, duration: 0.75, then: then)
    }
    
}
