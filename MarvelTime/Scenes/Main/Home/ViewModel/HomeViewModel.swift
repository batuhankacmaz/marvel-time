//
//  HomeViewModel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 18.06.2023.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?
    
    func configureCustomHeroesList(section: Int) {
        switch section {
        case Sections.YourNewIssues.rawValue:
            APICaller.shared.getCharacters(name: "spider-man") { result in
                switch result {
                case .success(let results):
                    let characters = results.data.results
                    self.notify(.yourNewIssues(characters))
                default:
                    print("error occured")
                }
            }
        case Sections.Previews.rawValue:
            APICaller.shared.getCharacters(name: "wolverine") { result in
                switch result {
                case .success(let results):
                    let characters = results.data.results
                    self.notify(.previews(characters))
                default:
                    print("error occured")
                }
            }
        case Sections.BasedOnYourPreferences.rawValue:
            APICaller.shared.getCharacters(name: "iron") { result in
                switch result {
                case .success(let results):
                    let characters = results.data.results 
                    self.notify(.basedOnPreferences(characters))
                default:
                    print("error occured")
                }
            }
        default:
            return 
            
        }
        
    }
    
    private func notify(_ output: HomeViewModelOutput) {
        delegate?.handleVMOutput(output)
    }
}
