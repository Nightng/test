//
//  ViewController.swift
//  BattleShips2
//
//  Created by Wilson Ng on 11/19/16.
//  Copyright © 2016 Wilson Ng. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var model : BattleshipModel? = nil
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09","10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"]
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "afterStart" {
            let next = segue.destination as! ViewController
            next.model = appDelegate.getModel1()
        }
        else if segue.identifier == "launch1" {
            let next = segue.destination as! ViewController2
            next.model = appDelegate.getModel2()
        }
        else  if segue.identifier == "view2" {
            let next = segue.destination as! ViewController
            next.model = appDelegate.getModel2()
        }
        else if segue.identifier == "launch2"{
            let next = segue.destination as! ViewController2
            next.model = appDelegate.getModel1()
        }
        else if segue.identifier == "view3" {
            let next = segue.destination as! ViewController
            next.model = appDelegate.getModel1()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if model != nil{
            loadShip()
        }
    }
    
    func loadShip(){
        var x = 0
        var y = 0
        for item in (model?.grid)!{
            for i in item{
                if i == 0 {
                    items[items.index(of: "\(x)\(y)")!] = ""
                }
                if i == 1 {
                    items[items.index(of: "\(x)\(y)")!] = "F"
                }
                if i == 2 {
                    items[items.index(of: "\(x)\(y)")!] = "H"
                }
                if i == 3 {
                    items[items.index(of: "\(x)\(y)")!] = "M"
                }
                if i == 4 {
                    items[items.index(of: "\(x)\(y)")!] = "S"
                }
                y += 1
            }
            x += 1
            y = 0
        }
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        if self.items[indexPath.item] == "F" {
            cell.backgroundColor = UIColor.blue
            cell.myLabel.textColor = UIColor.white
        }
        if self.items[indexPath.item] == "" {
            cell.backgroundColor = UIColor.cyan
        }
        if self.items[indexPath.item] == "H" || self.items[indexPath.item] == "S" || self.items[indexPath.item] == "M" {
            cell.backgroundColor = UIColor.red
            cell.myLabel.textColor = UIColor.white
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
}

