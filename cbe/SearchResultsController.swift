//
//  SearchResultsController.swift
//  cbe
//
//  Created by Victor Korir on 11/18/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import UIKit

protocol ReturnAddress {
    func returnedAddress(lng: Double, lat: Double, address: String)
}

class SearchResultsController: UITableViewController {
    
    var searchResults: [String]!
    var delegate: ReturnAddress!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchResults = Array()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultsCellIdentifier")

//        self.navigationController?.navigationBar.tintColor = UIColor.green
//        self.navigationController?.navigationBar.barTintColor = UIColor.green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCellIdentifier", for: indexPath)
        cell.textLabel?.text = self.searchResults[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        let urlpath = "https://maps.googleapis.com/maps/api/geocode/json?address=\(self.searchResults[indexPath.row])&sensor=false".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlpath!)
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) -> Void in
            do {
                if data != nil {
                    let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                    let lat = (((((dic.value(forKey: "results") as! NSArray).object(at: 0) as! NSDictionary).value(forKey: "geometry") as! NSDictionary).value(forKey: "location") as! NSDictionary).value(forKey: "lat")) as! Double
                    let lon = (((((dic.value(forKey: "results") as! NSArray).object(at: 0) as! NSDictionary).value(forKey: "geometry") as! NSDictionary).value(forKey: "location") as! NSDictionary).value(forKey: "lng")) as! Double
                    self.delegate.returnedAddress(lng: lon, lat: lat, address: self.searchResults[indexPath.row])
                }
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
    func reloadDataWithArray(_ array:[String]){
        self.searchResults = array
        self.tableView.reloadData()
    }
}
