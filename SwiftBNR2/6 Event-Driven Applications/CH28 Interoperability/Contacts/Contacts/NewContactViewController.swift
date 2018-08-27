//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Brigitte Michau on 2016/03/15.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var contactImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactImageView.image = DefaultImage.generateDefaultImageOfSize(contactImageView.frame.size)
    }
}
