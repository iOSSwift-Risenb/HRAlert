//
//  HRAlertReference.swift
//  HRAlert
//
//  Created by Obgniyum on 2018/1/24.
//

public extension HRAlert {
    
    //// message
    public class func message(_ message:String) {
        let time = Float(message.count) / 5.0 * 0.08 + 0.5
        alert(title: nil, message: message, duration: time, then: nil)
    }
    
    public class func message(_ message:String, _ then:@escaping ()->Void) {
        alert(title: nil, message: message, duration: 0.75, then: then)
    }
    
    //// action
    public class func action(_ message:String, _ item:String, _ handler:@escaping ()->Void ) {
        alert(title: nil, message: message, actionTitle: item, action: handler)
    }
    
    //// choose
    public class func choose(_ message:String, leftTitle: String, leftHandler: @escaping ()->Void, rightTitle: String, rightHandler: @escaping ()->Void) {
        alert(title: nil, message: message, leftTitle: leftTitle, leftHandler: leftHandler, rightTitle: rightTitle, rightHandler: rightHandler)
    }
    
}
