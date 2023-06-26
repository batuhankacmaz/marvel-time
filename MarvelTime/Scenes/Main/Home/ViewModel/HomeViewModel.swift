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
                case .success(let characters):
                    self.notify(.yourNewIssues(characters))
                case .failure(let error):
                    self.notify(.showErrorMessage(error.localizedDescription))
                }
            }
        case Sections.Previews.rawValue:
            APICaller.shared.getCharacters(name: "wolverine") { result in
                switch result {
                case .success(let characters):
                    self.notify(.previews(characters))
                case .failure(let error):
                    self.notify(.showErrorMessage(error.localizedDescription))
                }
            }
        case Sections.BasedOnYourPreferences.rawValue:
            APICaller.shared.getCharacters(name: "iron") { result in
                switch result {
                case .success(let characters):
                    self.notify(.basedOnPreferences(characters))
                case .failure(let error):
                    self.notify(.showErrorMessage(error.localizedDescription))
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
