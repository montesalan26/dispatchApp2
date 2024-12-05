//
//  loadingController.swift
//  Dispatch_app2
//
//  Created by Alan Montes on 12/4/24.
//

import UIKit

class loadingController: UIViewController {
    @IBOutlet weak var view87: UIView!
    @IBOutlet weak var view89: UIView!
    @IBOutlet weak var view91: UIView!
    @IBOutlet weak var viewCabDsl: UIView!
    @IBOutlet weak var viewCarbDyedDsl: UIView!
    @IBOutlet weak var viewRenewable: UIView!
    @IBOutlet weak var viewRenewableDyed: UIView!
    @IBOutlet weak var viewE85: UIView!
    @IBOutlet weak var viewEthanol: UIView!
    @IBOutlet weak var viewBio: UIView!
    @IBOutlet weak var viewMarine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.navigationItem.hidesBackButton = true
        
        view87.layer.cornerRadius = 30
        view87.layer.masksToBounds = true
        view89.layer.cornerRadius = 30
        view89.layer.masksToBounds = true
        view91.layer.cornerRadius = 30
        view91.layer.masksToBounds = true
        viewCabDsl.layer.cornerRadius = 30
        viewCabDsl.layer.masksToBounds = true
        viewCarbDyedDsl.layer.cornerRadius = 30
        viewCarbDyedDsl.layer.masksToBounds = true
        viewCarbDyedDsl.isHidden = true
        viewRenewable.layer.cornerRadius = 30
        viewRenewable.layer.masksToBounds = true
        viewRenewable.isHidden = true
        viewRenewableDyed.layer.cornerRadius = 30
        viewRenewableDyed.layer.masksToBounds = true
        viewRenewableDyed.isHidden = true
        viewE85.layer.cornerRadius = 30
        viewE85.layer.masksToBounds = true
        viewE85.isHidden = true
        viewEthanol.layer.cornerRadius = 30
        viewEthanol.layer.masksToBounds = true
        viewEthanol.isHidden = true
        viewBio.layer.cornerRadius = 30
        viewBio.layer.masksToBounds = true
        viewBio.isHidden = true
        viewMarine.layer.cornerRadius = 30
        viewMarine.layer.masksToBounds = true
        viewMarine.isHidden = true
        
        
        
    }



}
