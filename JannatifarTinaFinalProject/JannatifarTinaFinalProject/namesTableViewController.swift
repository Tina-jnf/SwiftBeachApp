

import UIKit
    //this class is to show the info on the table view controller
class namesTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        showImage()
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        //FlashcardsModel.shared.numberOfFlashcards()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.shared.numberOfBeaches()
    }
    //this function is to return the index that the user selected on the table view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        namesTableViewController.num=indexPath.row
        print(namesTableViewController.num)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        let beachName=names.shared.namesArrayFucntion(at: indexPath.row)
        cell.textLabel?.text = beachName?.getName()
        return cell
    }
    
    @IBOutlet var tableView:UITableView!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
        
    }
    func showImage(){

    }
    static let shared = namesTableViewController()
    static var num:Int = 1
}
    
