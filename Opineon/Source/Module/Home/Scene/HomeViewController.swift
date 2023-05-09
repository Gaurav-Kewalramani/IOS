//
//  HomeViewController.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 22/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Other Properties
    
    var newData = [Articles]()
    var fetchData = HomeViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        configureUI()
    }
    
    
    
    // MARK: - IB Actions
    
    
    @IBAction func didTapOnUser(_ sender: Any) {
        performSegue(withIdentifier: "UserProfile", sender: self)
    }
    @IBAction func didTapOnSearchIcon(_ sender: Any) {
        performSegue(withIdentifier: "SearchPost", sender: self)
    }
    
    @IBAction func didTapOnCreatePostIcon(_ sender: Any) {
        performSegue(withIdentifier: "CreatePost", sender: self)
    }
    
    @IBAction func didTapOnFredyIcon(_ sender: Any) {
        performSegue(withIdentifier: "FredyAi", sender: self)
    }
    
}
    extension HomeViewController {
        
        func configureUI() {
            fetchApi()
        }
        
        // MARK: - Fetching the API
        
        func fetchApi() {
            fetchData.parsingJson { data in
                self.newData = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    //MARK: - Table View Delegate and Datasource

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  newData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewPostsCell", for: indexPath) as! HomeViewPostsCell
        cell.titleOfPost?.text = newData[indexPath.row].title ?? "No Data"
        cell.postDescription?.text = newData[indexPath.row].description ?? "No Data"
        if newData[indexPath.row].urlToImage != nil
        {
            cell.profileImage?.downloaded(from: newData[indexPath.row].urlToImage!,contentMode: .scaleToFill)
        }
        else{
            cell.profileImage?.downloaded(from:"https://unsplash.com/photos/s0EKwK7xzT8",contentMode: .scaleToFill)
        }
        return cell
    }
}
    // MARK: - Image download from API

extension UIImageView{
    func downloaded(from url:URL,contentMode mode:ContentMode = .scaleAspectFit){
        contentMode = mode
        URLSession.shared.dataTask(with: url) {
            data,response,error in
            guard
                let data = data , error == nil ,
                let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async() { [weak self] in self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String ,contentMode mode:ContentMode = .scaleAspectFit)
    {
        guard let url = URL(string: link) else {return}
        downloaded(from: url,contentMode:mode)
    }
    
}
