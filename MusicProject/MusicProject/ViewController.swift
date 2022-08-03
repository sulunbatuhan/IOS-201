//
//  ViewController.swift
//  MusicProject
//
//  Created by batuhan on 2.08.2022.
//

import UIKit


class ViewController: UIViewController {

   
    var musicList : [music] = [music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addMusic()
        
    }
    
    func addMusic(){
        musicList.append(music(musicName: "Dansoz", artistName: "Serdar Ortaç", musicImage: "music1"))
        musicList.append(music(musicName: "Bir telefon", artistName: "Hakan Altun", musicImage: "music2"))
        musicList.append(music(musicName: "Suçlarımdan Biri", artistName: "Güneş", musicImage: "music3"))
        musicList.append(music(musicName: "Matmazel", artistName: "Tanerman", musicImage: "matmazel"))
        musicList.append(music(musicName: "Kafayı Yaktım", artistName: "Anıl Durmuş", musicImage: "anıldurmus"))
        musicList.append(music(musicName: "Yangın Var", artistName: "Buray", musicImage: "buray"))
    }
    
    

}


extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let music = musicList[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = music.musicName
        cell.detailTextLabel?.text = music.artistName
        cell.imageView?.image = UIImage(named: music.musicImage)
        cell.textLabel?.font = UIFont(name: "Copperlate", size: 20)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MusicPlayer") as? PlayViewController else{return}
        vc.musicList = musicList
        vc.row = row
        
        
        present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
    
}
