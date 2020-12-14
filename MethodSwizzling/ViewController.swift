//
//  ViewController.swift
//  MethodSwizzling
//
//  Created by 김소은 on 2020/12/14.
//

import UIKit

extension UIViewController {
    class func swizzleMethod() {
        let originalSelector = #selector(viewWillAppear)
        let swizzleSelector = #selector(swizzleViewWillAppear)

        guard
            let originMethod = class_getInstanceMethod(UIViewController.self, originalSelector),
            let swizzleMethod = class_getInstanceMethod(UIViewController.self, swizzleSelector)
        else { return }
        
        method_exchangeImplementations(originMethod, swizzleMethod)
    }
    
    @objc public func swizzleViewWillAppear(animated: Bool) {
        print("🌞 swizzleViewWillAppear")
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("🌑 override viewWillAppear")
    }
}

