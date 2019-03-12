//
//  PokemonModel.swift
//  guess me
//
//  Created by Sai-Mork on 24/2/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import Foundation

class PokemonModel: Codable{
    
    var name: String?
    var sprites: PokemonSpriteModel?
}

class PokemonSpriteModel: Codable{
    var front_default: String?
}
