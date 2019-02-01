//
//  ViewController.swift
//  ios_notification_example
//
//  Created by codexpedia on 1/31/19.
//  Copyright © 2019 codexpedia. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let AButtonIsTapped = Notification.Name("AButtonIsTapped")
}

class ViewController: UIViewController {
    
    private var buttonTapObserver: NSObjectProtocol?
    private var buttonTapObserver2: NSObjectProtocol?
    private var buttonTapObserver3: NSObjectProtocol?
    
    @IBOutlet weak var tapButton: UIButton!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        // listens to the AButtonIsTapped event and it can come from any object
        self.buttonTapObserver = NotificationCenter.default.addObserver(
            forName: .AButtonIsTapped,
            object: nil,
            queue: OperationQueue.main,
            using: { notification in
                print("observer111111: A button is tapped")
        }
        )
        
        // listens to the AButtonIsTapped event and it has to come from the tapButton object
        self.buttonTapObserver2 = NotificationCenter.default.addObserver(
            forName: .AButtonIsTapped,
            object: self.tapButton,
            queue: OperationQueue.main,
            using: { notification in
                print("observer222222: A button is tapped")
        }
        )
        
        // listens to the AButtonIsTapped event and it has to come from self, this view controller
        self.buttonTapObserver3 = NotificationCenter.default.addObserver(
            forName: .AButtonIsTapped,
            object: self,
            queue: OperationQueue.main,
            using: { notification in
                print("observer333333: A button is tapped")
        }
        )
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // post the AButtonIsTapped event with the tapButton object, only buttonTapObserver and buttonTapObserver1 will observe this, buttonTapObserver3 will not because it only observes object coming from this view controller
        NotificationCenter.default.post(name: .AButtonIsTapped, object: sender)
    }
    
}
