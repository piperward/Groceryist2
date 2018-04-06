//
//  PopoverViewController.swift
//  Groceryist
//
//  Created by Piper Ward on 3/2/18.
//  Copyright © 2018 Piper Ward. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDelegate {
    func getItemDetails (itemToReceive:Item)
}

class PopoverViewController: UIViewController {
    var delegate:ItemDelegate!
    
    //MARK: Properties
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var discardBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var itemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    @IBAction func onDiscardPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSavePressed(_ sender: Any) {
        if !(itemTextField.text?.isEmpty)! {
            sendItemDetails()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func sendItemDetails() {
        let note = Item(text: itemTextField.text!)
        delegate.getItemDetails(itemToReceive: note)
    }
}

