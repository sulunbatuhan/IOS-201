//
//  KayitVC.swift
//  NoteProject
//
//  Created by batuhan on 4.09.2022.
//

import UIKit

class KayitVC: UIViewController {

    @IBOutlet weak var baslik: UITextField!
    @IBOutlet weak var textNote: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemYellow
        textNote.backgroundColor = .white
        
      Design()
        
    }
    func Design(){
        let tasarim = UINavigationBarAppearance()
        tasarim.backgroundColor = UIColor.systemYellow
        navigationItem.scrollEdgeAppearance = tasarim
        navigationItem.compactAppearance = tasarim
        navigationItem.standardAppearance = tasarim
        
    }
    
    func Kaydet(baslik: String,text : String){
        let context = AppDel.persistentContainer.viewContext
        let newNote = Notes(context: context)
        newNote.baslik = baslik
        newNote.notes = text
        AppDel.saveContext()
    }

    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        if let txtNote = textNote.text, let txtBaslik = baslik.text{
       
         
            Kaydet(baslik: txtBaslik, text: txtNote)
            navigationController?.popToRootViewController(animated: true)
            
            
        }
    }
    

}
