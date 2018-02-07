
//
//  HRAlert.swift
//  HRAlert
//
//  Created by Obgniyum on 2018/1/24.
//

public typealias VoidClosure = ()->()


enum AlertType:Int {
    case message = 1
    case action
}

open class HRAlert: NSObject {
    
    public class func alert(title: String?, message: String, duration: Float, then: VoidClosure?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let objsArr:Array<Any>!
        objsArr = [AlertType.message, alert, duration, then as Any]
        
        UIViewController().perform(#selector(UIViewController.present(objs:)), on: .main, with: objsArr, waitUntilDone: false)
    }
    
    public class func alert(title: String?, message: String, actTitle:String, action: VoidClosure?) {
        // alert
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let item = UIAlertAction.init(title: actTitle, style: .default) { (_) in
            if let act = action {
                act()
            }
        }
        alert.addAction(item)
        
        //
        let objsArr:Array<Any>!
        objsArr = [AlertType.action, alert]
        
        //
        UIViewController().perform(#selector(UIViewController.present(objs:)), on: .main, with: objsArr, waitUntilDone: false)
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
        
        //
        let objsArr:Array<Any>!
        objsArr = [AlertType.action, alert]
        
        //
        UIViewController().perform(#selector(UIViewController.present(objs:)), on: .main, with: objsArr, waitUntilDone: false)
    }
}

public extension UIViewController {
    @objc public func present(objs:Array<Any>) {
        
        let root:UIViewController! = UIApplication.shared.keyWindow?.rootViewController
        let alert = objs[1] as! UIViewController
        
        switch objs.first as! AlertType {
        case .message:
            let duration = objs[2] as! Float
            let then = objs[3] as? VoidClosure
            
            var top = root!.presentedViewController
            var bottom = root
            while top != nil {
                top = top!.presentedViewController
                bottom = bottom?.presentedViewController
            }
            
            bottom!.present(alert, animated: true, completion: {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(duration * 1000))) {
                    if root.presentedViewController != nil {
                        root.presentedViewController?.dismiss(animated: true, completion: then)
                    }
                }
            })
            
        case .action:
            
            var top = root!.presentedViewController
            var bottom = root
            while top != nil {
                top = top!.presentedViewController
                bottom = bottom?.presentedViewController
            }
            
            bottom!.present(alert, animated: true, completion:nil)
        }
    }
}





