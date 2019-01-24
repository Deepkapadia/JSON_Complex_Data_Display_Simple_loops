//
//  ViewController.swift
//  JsonParsingWithNormalForloop
//
//  Created by DeEp KapaDia on 24/01/19.
//  Copyright © 2019 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var arr = [[String:Any]]()
    var source = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                JsonData()
        
        }
  
    func JsonData(){
        
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2018-12-24&sortBy=publishedAt&apiKey=92c86276cd1a4320a05d83c9e5d6f95a")
        
        
        URLSession.shared.dataTask(with: url!) { (data, resp, error) in
            
            if error != nil{
                
                print("I dnt knw")
                
                DispatchQueue.main.async {
                    
                    
                }
            }else {
                
                do{
                    
                    let parseJSON = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    
                    for (key , value) in parseJSON{
                        
                        //print("\(key)-------------------------------------------\(value)")
                        if (key == "articles"){
                            
                            if let articleARR:[[String:Any]] = value as? [[String:Any]]{
                                
                                self.arr = articleARR
                                //print("kjasghd fkghaksdjf kajsdfh kjashdf kjash dkjash dkjhas kdjh aksjdh kjashd")
                                
                                for dictionary in articleARR{
                                    
                                    for (key , value) in dictionary{
                                        
                                        if (key == "author"){
                                            
                                            print(" Author : \(value)")
                                            //self.author.append(value as! String)
                                        }else if (key == "url"){
                                            
                                            print(" URL : \(value)")
                                            //self.urlPath.append(value as! String)
                                        }else if (key == "title"){
                                            
                                            print(" Title : \(value)")
                                            //self.ttitle.append(value as! String)
                                            
                                        }else if (key == "source"){
                                            
                                            if let sourceObject: [String:Any] = value as? [String:Any]{
                                                
                                                self.source = sourceObject
                                                //print(sourceObject)
                                                
                                                for (key,value ) in sourceObject{
                                                    
                                                    if (key == "id"){
                                                        
                                                        print(" id : \(value)")
                                                        //self.id.append(value as! String)
                                                        
                                                    }else if (key == "name") {
                                                        
                                                        print(" name : \(value)")
                                                        //self.name.append(value as! String)
                                                        
                                                    }
                                                }
                                            }
                                        }else if (key == "description"){
                                            
                                            print("Desctription: \(value)")
                                            //self.descript.append(value as! String)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }catch let error as NSError{
                    
                    print(error)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                        
                        
                        
                    })
                    
                }
                
            }
            }.resume()
        
        
    }
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return arr.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier:  "Cell") as! CellFile
//
//
//        //cell.Author.text = arr[indexPath.section]
//
//
//        return cell
//    }
    
        
}


    
    
    
    

















