//
//  Pokemon.swift
//  Pokedex
//
//  Created by Pourpre on 11/1/16.
//  Copyright © 2016 Pourpre. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {

    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    
    private var _pokemonURL: String!
    
    
    var description: String {
        
        if _description == nil {
            
            _description = ""
            
        }
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = ""
            
        }
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = ""
            
        }
        return _defense
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
            
        }
        return _height
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = ""
            
        }
        return _weight
    }
    
    
    var attack: String {
        
        if _attack == nil {
            
            _attack = ""
            
        }
        return _attack
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
            
            _nextEvolutionTxt = ""
        
        }
        return _nextEvolutionTxt
    }
    
    var nextEvolutionName: String {
        
        if _nextEvolutionName == nil {
            
            _nextEvolutionName = ""
            
        }
        return _nextEvolutionName
    }
    
    
    var nextEvolutionId: String {
        
        if _nextEvolutionId == nil {
            
            _nextEvolutionId = ""
            
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionLevel: String {
        
        if _nextEvolutionLevel == nil {
            
            _nextEvolutionLevel = ""
            
        }
        return _nextEvolutionLevel
    }
    
    
    
    
    
    var name: String {
    
        return _name
    }
    
    var pokedexId: Int {
    
        return _pokedexId
    }

    init(name: String, pokedexId: Int) {
    
        self._name = name
        self._pokedexId = pokedexId
        if pokedexId < 10 {
            self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)00\(self.pokedexId)/"
        } else if pokedexId < 100 {
            self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)0\(self.pokedexId)/"
        } else {
            self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        }
    }
    
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {

        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                
                if let attack = dict["baseattack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["basedefense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let type = dict["type"] as? String {
                    self._type = "\(type)"
                }
                
                if let description = dict["description"] as? String {
                    self._description = description
                }
                
                if let evoLvl = dict["evolvl"] as? Int {
                    
                    self._nextEvolutionLevel = "\(evoLvl)"
                    
                    if evoLvl > 0 {
                        
                        if let evoIndex = dict["evoindex"] as? String {
                            
                            self._nextEvolutionId = evoIndex
                            
                            let evoURL = "\(URL_BASE)\(URL_POKEMON)\(evoIndex)"
                            
                            Alamofire.request(evoURL).responseJSON(completionHandler: { (response) in
                                if let evoDict = response.result.value as? Dictionary<String, AnyObject> {
                                    
                                    if let evoName = evoDict["name"] as? String {
                                        
                                        self._nextEvolutionName = evoName
                                    }
                    
                                }
                                
                                completed()
                            
                            })
                        
                        }
                    
                    } else {
                        
                        self._nextEvolutionName = ""
                    
                    }
                
                }
                
            }
            
            completed()
            
        }
        
    }

}
