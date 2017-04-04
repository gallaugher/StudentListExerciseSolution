//
//  ViewController.swift
//  StudentList-inClass
//
//  Created by John Gallaugher on 3/20/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var studentArray = [String]()
    
//    var studentArray = ["Jared Annibale",
//                        "Michael F Barrett",
//                        "Evelyn C Baxley",
//                        "Christina Be",
//                        "Patrick R Calabrese",
//                        "Michael C Dady",
//                        "William R Farley",
//                        "Brittany V Foley",
//                        "Amanda E Gilmour",
//                        "Elizabeth N Hanley",
//                        "Taylor R Hansen",
//                        "Worthan K Kwan",
//                        "Timothy Linehan",
//                        "Jakob J Mnich",
//                        "Gary Petrie",
//                        "Dominick M Ronan",
//                        "Carley M Ryan",
//                        "Nicholas M Ryan",
//                        "Kevin J Sheehy",
//                        "Kerri A Shields",
//                        "Alexander J Trummer",
//                        "Liuke Yang",
//                        "Angela Zhang"]
    
    var defaultsData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        studentArray = defaultsData.stringArray(forKey: "studentArray") ?? [String]()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToEdit" {
            let destinationController = segue.destination as! StudentDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            destinationController.studentName = studentArray[indexPath.row]
        } else {
            if let selectedRow = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedRow, animated: false)
            }
        }
    }
    

    @IBAction func unwindFromStudentDetailView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? StudentDetailViewController, let newStudentName = sourceViewController.studentName {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                studentArray[selectedIndexPath.row] = newStudentName
                tableView.reloadData()
            } else {
                studentArray.append(newStudentName)
                let newIndexPath = IndexPath(row: studentArray.count-1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            defaultsData.set(studentArray, forKey: "studentArray")
        }
    }
}

extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = studentArray[indexPath.row]
        return cell
    }
    
}

