//
//  SavedTshirts.swift
//  MyTshirtDesigner
//
//  Created by Aiden Overton on 1/25/22.
//

import UIKit

class SavedTshirts: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var Desgins = [SavedDesigns]()
    
    @IBOutlet weak var TableViewCell: UITableViewCell!
    @IBOutlet weak var Tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Tableview.dataSource = self
        Tableview.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Desgins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "mycell")!
        cell.textLabel?.text = Desgins[indexPath.row].name
        return cell
    }
    
}
