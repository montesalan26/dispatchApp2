//
//  fuelAnalysisReport.swift
//  Dispatch_app2
//
//  Created by Alan Montes on 11/26/24.
//

import UIKit

class fuelAnalysisReport: UIViewController {

    @IBOutlet weak var hoursWorkedProfit: UIImageView!
    @IBOutlet weak var density: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        

    }
    
    @objc func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer) {
            // Check which image view is being pinched and update its transform
            if gestureRecognizer.state == .changed {
                let scale = gestureRecognizer.scale
                gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: scale, y: scale))!
                gestureRecognizer.scale = 1.0 // Reset scale for next pinch gesture
        }
    }
}
        
