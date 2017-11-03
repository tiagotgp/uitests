//
//  SearchViewController.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 09/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var searchText: UITextField!
    @IBOutlet var tableView: UITableView!
    
    weak var delegate: ViewController!
    
    var searchResults: [Movie] = []
    let APIKEY: String = "3b45e6afd555c1b95dc09d6469ebc258"
    
    @IBAction func search(sender: UIButton) {
        print("Searching")
        var searchTerm = searchText.text!
        if searchTerm.characters.count > 2 {
            retrieveMoviesByTerm(searchTerm: searchTerm)
        }
    }
    
    func retrieveMoviesByTerm(searchTerm: String){
        let url = "https://api.themoviedb.org/3/search/movie?api_key=\(APIKEY)&query=\(searchTerm)"
        HTTPHandler.getJson(urlString: url, completionHandler: parseDataIntoMovies)
    }

    
    func parseDataIntoMovies(data: Data?) -> Void {
        if let data = data{
            let object = JSONParser.parse(data: data)
            if let object = object {
                if MovieDataProcessor.mapJsonToMovies(object: object, moviesKey: "results").isEmpty {
                    let alert = UIAlertController(title: "No movies found", message: "Search has not found the movies you requested", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil))
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                else {
                    self.searchResults = MovieDataProcessor.mapJsonToMovies(object: object, moviesKey: "results")
                    DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            }
        }
    }
    
    @IBAction func addFav (sender: UIButton) {
        print("Item #\(sender.tag) was selected as a favourite")
        self.delegate.favouriteMovies.append(searchResults[sender.tag])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search Results"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // grouped vertical sections of the tableview
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        moviecell.movieImageView?.image = nil
        
        let idx: Int = indexPath.row
        moviecell.favouriteButton.tag = idx
        
        moviecell.movieTitle?.text = searchResults[idx].title
        moviecell.movieYear?.text = searchResults[idx].year
        displayMovieImage(idx, moviecell: moviecell)
        
        return moviecell
    }
    
    func displayMovieImage(_ row: Int, moviecell: CustomTableViewCell) {
        let url: String = searchResults[row].imageUrl
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{
            (data, response, error) -> Void in
            if error != nil{
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
        }).resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
