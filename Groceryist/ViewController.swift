//
//  ViewController.swift
//  Groceryist
//
//  Created by Piper Ward on 3/2/18.
//  Copyright © 2018 Piper Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, UITableViewDataSource, ItemDelegate {
    func getItemDetails(itemToReceive: Item) {
        //self.data.insert(noteToReceive, at: 0)
        self.data.append(itemToReceive)
        self.data.sort(by: {$0.category < $1.category})
        let index = self.data.index(where: { $0.body == itemToReceive.body })
        
        self.tableView.beginUpdates()
        if (index != nil) {
            self.tableView.insertRows(at: [IndexPath.init(row: index!, section: 0)], with: .automatic)
        }
        else {
            self.tableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .automatic)

        }
        self.tableView.endUpdates()
    }
    
    private var data: [Item] = [Item(body: "bacon", category: "Meat"),
                                Item(body: "Apples", category: "Produce"),
                                Item(body: "basil", category: "Seasoning")]
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onAddButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showPopover", sender: AnyClass.self)
    }
    
    //MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! ItemTableViewCell
        
        let item = data[indexPath.row]
        
        cell.bodyLabel.text = item.body
        cell.dateLabel.text = item.getDate()
        cell.categoryLabel.text = item.category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: PopoverPresentation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopover" {
            let vc = segue.destination
            vc.preferredContentSize = CGSize(width: 200, height: 74)
            let controller = vc.popoverPresentationController

            if controller != nil {
                controller?.delegate = self
            }
            if let destination = segue.destination as? PopoverViewController {
                destination.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}


