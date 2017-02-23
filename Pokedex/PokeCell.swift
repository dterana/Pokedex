//
//  PokeCell.swift
//  Pokedex
//
//  Created by Pourpre on 11/1/16.
//  Copyright © 2016 Pourpre. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    
    func configureCell(pokemon: Pokemon) {
    
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(pokemon.pokedexId)")
        if pokemon.pokedexId < 10
        {
            thumbImg.image = UIImage(named: "00\(pokemon.pokedexId)")
        } else if pokemon.pokedexId < 100 {
            thumbImg.image = UIImage(named: "0\(pokemon.pokedexId)")
        }
    }
    
}
