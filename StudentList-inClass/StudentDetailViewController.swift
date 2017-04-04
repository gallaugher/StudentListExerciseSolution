//
//  StudentDetailViewController.swift
//  StudentList-inClass
//
//  Created by John Gallaugher on 3/20/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var studentName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.text = studentName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        studentName = nameField.text
    }
    

    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
        
        
    }
    


}
