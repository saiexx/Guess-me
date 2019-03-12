//
//  GameViewController.swift
//  guess me
//
//  Created by Sai-Mork on 24/2/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import UIKit
import Kingfisher

class GameViewController: UIViewController {

//    var imageList:[UIImage] = [#imageLiteral(resourceName: "lion"),#imageLiteral(resourceName: "llama"),#imageLiteral(resourceName: "koala")]
//    var answers: [String] = ["lion","llama","koala"]
    var currentIndex = 0
    var heart = 5
    var score = 0
    var answer = ""
    
    let pokemonAPIManager = PokemonAPIManager()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var heartLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heartLabel.text = String(repeating: "❤️", count: heart)
        scoreLabel.text = "Score : \(score)"
        score = 0
        loadPokemonData()
    }
    
    private func loadPokemonData(){
        let id = Int.random(in: 1...140)
        pokemonAPIManager.getPokemonDetails(id: id) {(pokemonModel) in
            self.answer = pokemonModel.name!
            self.textField.placeholder = self.placeholderHint()
            let url = URL(string: pokemonModel.sprites!.front_default!)!
            self.imageView.kf.setImage(with: url)
            print(self.answer)
        }
    }
    
    func placeholderHint() -> String {
        let alphabet = ["a","e","i","o","u"]
        var placeholder = ""
        for i in answer {
            if alphabet.contains(String(i)) {
                placeholder = placeholder + String(i)
            } else {
                placeholder = placeholder + "⎕"
            }
        }
        return placeholder
    }

    @IBAction func didTapSubmit(_ sender: Any) {
        
        if self.answer == textField.text?.lowercased() {
            loadPokemonData()
            incorrectLabel.isHidden = true
            score += 1
            textField.text = ""
            scoreLabel.text = "Score : \(score)"
        } else {
            incorrectLabel.text = "\(textField.text!) \n ผิดโว้ย"
            incorrectLabel.isHidden = false
            
            heart -= 1
            heartLabel.text = String(repeating: "❤️", count: heart)
            
            if heart == 0 {
                let alert = UIAlertController(title: "You lose", message: "นายได้ \(score) คะแนน", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in self.dismiss(animated: true, completion: nil)}))
                present(alert,animated:true)
            }
        }
    }
    
}
