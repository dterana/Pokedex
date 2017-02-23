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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nameLbl.text = pokemon.name.capitalized
        var  img = UIImage(named: "\(pokemon.pokedexId)")
        if pokemon.pokedexId < 10 {
            img = UIImage(named: "00\(pokemon.pokedexId)")
        } else if pokemon.pokedexId < 100 {
            img = UIImage(named: "0\(pokemon.pokedexId)")
        }
        mainImg.image = img
        
        pokedexIDLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            
            // Called after the network call is complete!
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        //add pokemon.pokedexId == 38 condition to resolve an error in the pokeapi
        if pokemon.nextEvolutionId == ""
            || pokemon.pokedexId == 34  //add pokemon.pokedexId == 34 condition to resolve an error in the pokeapi
            || pokemon.pokedexId == 38  //add pokemon.pokedexId == 38 condition to resolve an error in the pokeapi
        {
        
            evoLbl.text = "No evolution"
            nextEvoImg.isHidden = true
            
        } else {
            
            var  str = "Next Evolution: \(pokemon.nextEvolutionName)"
            if pokemon.nextEvolutionLevel != "" {
                
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            evoLbl.text = str
            let evoId = Int(pokemon.nextEvolutionId)!
            nextEvoImg.image = UIImage(named: "\(evoId)")
            if evoId < 10 {
                nextEvoImg.image = UIImage(named: "00\(evoId)")
            } else if evoId < 100 {
                nextEvoImg.image = UIImage(named: "0\(evoId)")
            }
            nextEvoImg.isHidden = false
        }
    
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
