//
//  HRAlert.swift
//  HRAlert
//
//  Created by Obgniyum on 2018/1/24.
//

open class HRAlert: NSObject {
    
    public class func alert(title: String?, message: String, duration: Float, then: (() -> ())?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let root = UIApplication.shared.keyWindow?.rootViewController
        root!.present(alert, animated: false, completion: {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(duration * 1000))) {
                if root!.presentedViewController != nil {
                    root!.presentedViewController?.dismiss(animated: true, completion: then)
                }
            }
        })
    }
}



