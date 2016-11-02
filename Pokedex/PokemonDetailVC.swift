//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Pourpre on 11/2/16.
//  Copyright © 2016 Pourpre. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nameLbl.text = pokemon.name
        
    }

}
