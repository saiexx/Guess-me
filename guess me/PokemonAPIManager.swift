//
//  PokemonAPIManager.swift
//  guess me
//
//  Created by Sai-Mork on 24/2/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import Foundation
import Alamofire

class PokemonAPIManager{
    
    let host = "https://pokeapi.co/api/v2/"
    
    func getPokemonDetails(id: Int, completion: @escaping (PokemonModel)->()) {
        let path = "pokemon/\(id)/"
        
        Alamofire.request("\(host)\(path)").responseJSON{ (response) in
            let decoder = JSONDecoder()
            let pokemon = try! decoder.decode(PokemonModel.self, from: response.data!)
            completion(pokemon)
            
        }
        
    }
}
