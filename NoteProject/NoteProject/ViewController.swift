//
//  ViewController.swift
//  NoteProject
//
//  Created by batuhan on 4.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchList: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var notes = [Notes]()
    let context = AppDel.persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchList.delegate = self
        tableView.backgroundColor = UIColor.systemYellow
       
        Fetch()
        Design()
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        Fetch()
        self.tableView.reloadData()
    }
    
    func Design(){
        let tasarim = UINavigationBarAppearance()
        tasarim.backgroundColor = UIColor.systemYellow
        navigationItem.scrollEdgeAppearance = tasarim
        navigationItem.compactAppearance = tasarim
        navigationItem.standardAppearance = tasarim
    }
    
   func Fetch(){
        do {
            let list = try context.fetch(Notes.fetchRequest())
            notes = list
            
        }catch{
            print(error.localizedDescription)
        }
    }

    
    
    @IBAction func NewNoteButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ToSave", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetay"{
            if let rows = sender  as? Notes{
                let gVC = segue.destination as! DetayVC
                 gVC.notes = rows
            }
        }
    }
    
}


extension ViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            Fetch()
            self.tableView.reloadData()
        }else {
            do{
                let FetchRequest = Notes.fetchRequest()
                FetchRequest.predicate = NSPredicate(format: "baslik CONTAINS %@", searchText)
                let liste = try self.context.fetch(FetchRequest)
                
                notes = liste
                self.tableView.reloadData()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BaslikCell
      
        cell.baslik.text = rows.baslik
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let DeleteAction = UIContextualAction(style: .destructive, title: "Sil"){(contextulaciton,view,bool) in
            let rows = self.notes[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(rows.baslik!) Silinsin mi?", preferredStyle: .alert)
            let Cancel = UIAlertAction(title: "İptal", style: .cancel)
            let OK = UIAlertAction(title: "Sil", style: .destructive){ action in
                self.context.delete(rows)
                AppDel.saveContext()
                self.Fetch()
                self.tableView.reloadData()
                
            }
            alert.addAction(Cancel)
            alert.addAction(OK)
            
            
            self.present(alert, animated: true)
            
           
        }
        return UISwipeActionsConfiguration(actions: [DeleteAction])
     
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rows = notes[indexPath.row]
        performSegue(withIdentifier: "ToDetay", sender: rows)
    }
    
}

