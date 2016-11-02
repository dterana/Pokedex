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
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
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
            currentEvoImg.isHidden = false
            nextEvoImg.isHidden = true
            
        } else {
            
            var  str = "Next Evolution: \(pokemon.nextEvolutionName)"
            if pokemon.nextEvolutionLevel != "" {
                
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            evoLbl.text = str
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            currentEvoImg.isHidden = false
            nextEvoImg.isHidden = false
        }
    
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
