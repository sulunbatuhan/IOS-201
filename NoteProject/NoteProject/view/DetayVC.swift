//
//  DetayVC.swift
//  NoteProject
//
//  Created by batuhan on 4.09.2022.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var DetayTextView: UITextView!
    
    @IBOutlet weak var DetayBaslik: UITextField!
    
    var notes : Notes?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let textNotes = notes{
            DetayBaslik.text = notes?.baslik
            DetayTextView.text = notes?.notes
        }
        
     Design()
        
    }
    
    func Design(){
        let tasarim = UINavigationBarAppearance()
        tasarim.backgroundColor = UIColor.systemYellow
        navigationItem.scrollEdgeAppearance = tasarim
        navigationItem.compactAppearance = tasarim
        navigationItem.standardAppearance = tasarim
        
    }
    

    @IBAction func Duzenle(_ sender: UIBarButtonItem) {
        if let newNotes = DetayTextView.text,let newBaslik = DetayBaslik.text,let id = notes{
            Guncelle(notes: id, baslik: newBaslik, text: newNotes)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func Guncelle(notes : Notes, baslik: String,text : String){
        let context = AppDel.persistentContainer.viewContext
        
        notes.baslik = baslik
        notes.notes = text
        AppDel.saveContext()
    }
    
}
