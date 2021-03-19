//
//  MenuTableViewController.swift
//  Rntc
//
//  Created by Domiik on 04.03.2021.
//

import UIKit


class MenuTableViewController: UITableViewController {
    
    var activityIndicatorView: UIActivityIndicatorView!
    var urlTransition: String!
    //var refreshControl: UIRefreshControl!
    let apiClient = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView = UIActivityIndicatorView(style: .white)
        tableView.backgroundView = activityIndicatorView
        activityIndicatorView.startAnimating()
        //        self.refreshControl = UIRefreshControl()
        //        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //        self.refreshControl!.addTarget(self, action: #selector(reloadData), for: UIControl.Event.valueChanged)
        
        
        reloadData()
    }
    
    
    @objc func reloadData() {
        DataService.instance.downloadItem(url: urlTransition, completionHandler: {
            (isSuccess) in
            DispatchQueue.main.async {
                if isSuccess {
                    for item in DataService.instance.items {
                        item.downloadImage(completionHandler: {_ in
                            self.tableView.reloadData()
                            self.activityIndicatorView.stopAnimating()
                            self.refreshControl?.endRefreshing()
                        })
                    }
                } else {
                    print("error alert")
                }
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.removeAllItem()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(DataService.instance.items.count)
        return DataService.instance.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! MenuTableViewCell
        
        let item = DataService.instance.items[indexPath.row]
        cell.configureCell(item)
        
        return cell
    }
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
