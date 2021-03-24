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
    
    var nameNavigationBar: String!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = nameNavigationBar
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        tableView.backgroundView = activityIndicatorView
        activityIndicatorView.startAnimating()
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
                    let alert = UIAlertController(title: "Нет интернет соединения!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
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
        return DataService.instance.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! MenuTableViewCell
        
        let item = DataService.instance.items[indexPath.row]
        cell.configureCell(item)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Contact" {
            guard let destination = segue.destination as? ContactViewController else { return }
            switch urlTransition {
            case PROGRAMMING_URL:
                destination.nameContact = "PV"
                break
            case MODELING_URL:
                destination.nameContact = "EV"
                break
            case SCANING_URL:
                destination.nameContact = "MP"
                break
            case ROBOTS_URL:
                destination.nameContact = "MP"
                break
            case PRODUCTION_URL:
                destination.nameContact = "MP"
                break
            default:
                destination.nameContact = "MP"
                break
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        newImage = selectedCell.imageMenu.image
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? ContentViewController {
            vc.passedImage = newImage
            present(vc, animated: true, completion: nil)
        }
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
