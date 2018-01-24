//
//  HRAlert.swift
//  HRAlert
//
//  Created by Obgniyum on 2018/1/24.
//

open class HRAlert: NSObject {
    
    public class func alert(title: String?, message: String, duration: Float, then: ( ()->Void )?) {
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
    
    public class func alert(title: String?, message: String, actionTitle:String, action: @escaping ()->Void) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let item = UIAlertAction.init(title: actionTitle, style: .default) { (itemAction) in
            action()
        }
        alert.addAction(item)
        let root = UIApplication.shared.keyWindow?.rootViewController
        root!.present(alert, animated: false, completion: nil)
    }
    
    public class func alert(title: String?, message: String, leftTitle: String, leftHandler: @escaping ()->Void, rightTitle: String, rightHandler: @escaping ()->Void) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let leftItem = UIAlertAction.init(title: leftTitle, style: .default) { (_) in
            leftHandler()
        }
        alert.addAction(leftItem)
        let rightItem = UIAlertAction.init(title: rightTitle, style: .default) { (_) in
            rightHandler()
        }
        alert.addAction(rightItem)
        let root = UIApplication.shared.keyWindow?.rootViewController
        root!.present(alert, animated: false, completion: nil)
    }
}



