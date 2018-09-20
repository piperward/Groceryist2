//
//  Note.swift
//  Groceryist
//
//  Created by Piper Ward on 3/2/18.
//  Copyright © 2018 Piper Ward. All rights reserved.
//

import Foundation

class Item {
    private var date : NSDate
    var body: String
    var category: String
    
    init(text: String) {
        date = NSDate()
        body = text
        category = ""
        category = findCategory(itemName: text.lowercased())
    }
    
    init(body: String, category: String) {
        date = NSDate()
        self.body = body
        self.category = category
    }
    
    func getDate() -> String {
        let dateFormate = DateFormatter ()
        dateFormate.dateFormat = "MM/dd/yyyy"
        return dateFormate.string(from: date as Date)
    }
    
    func update(text: String, category: String) {
        body = text
        self.category = category
        date = NSDate()
    }
    
    ///find category of grocery item
    /// - Param: String containing the name of the item
    /// - Return: Category of item based on FoodData.foodCategories
    ///           if itemName does not fit a category, return nil
    private func findCategory (itemName: String) -> String {
        var category: String
        if FoodData.fruits.contains(itemName) || FoodData.vegetables.contains(itemName) {
            category = "Produce"
        }
        else if FoodData.meat.contains(itemName) {
            category = "Meat"
        }
        else if FoodData.bakery.contains(itemName) || FoodData.baking.contains(itemName) {
            category = "Baking"
        }
        else if FoodData.breakfast.contains(itemName) {
            category = "Breakfast"
        }
        else if FoodData.cans.contains(itemName) || FoodData.sauces.contains(itemName) {
            category = "Cans & Jars"
        }
        else if FoodData.seafood.contains(itemName) {
            category = "Seafood"
        }
        else if FoodData.drinks.contains(itemName) {
            category = "Drinks"
        }
        else if FoodData.frozen.contains(itemName) {
            category = "Frozen"
        }
        else {
            category = ""
        }
        return category
    }
    
}

