//
//  HomeViewModel.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 18.06.2023.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    weak var delegate: HomeViewModelDelegate?
    
    func HomeUIEvents(_ event: HomeUIEvent) {
        switch event {
        case .fetchAll:
            fetchAll()
        case .yourNewIssues:
            fetchYourNewIssues()
        case .previews:
            fetchPreviews()
        case .basedOnYourPreferences:
            fetchBasedOnPreferences()
        }
    }
    
    
    private func fetchAll() {
        fetchYourNewIssues()
        fetchPreviews()
        fetchBasedOnPreferences()
    }
    
    private func fetchYourNewIssues() {
        APICaller.shared.getCharacters(name: "spider-man") { result in
            switch result {
            case .success(let results):
                let characters = results.data.results
                self.notify(.yourNewIssues(characters))
            default:
                print("error occured")
            }
        }
    }
    
    private func fetchPreviews() {
        APICaller.shared.getCharacters(name: "wolverine") { result in
            switch result {
            case .success(let results):
                let characters = results.data.results
                self.notify(.previews(characters))
            default:
                print("error occured")
            }
        }
    }
    
    private func fetchBasedOnPreferences() {
        APICaller.shared.getCharacters(name: "iron") { result in
            switch result {
            case .success(let results):
                let characters = results.data.results
                self.notify(.basedOnPreferences(characters))
            default:
                print("error occured")
            }
        }
    }
    
    private func notify(_ output: HomeViewModelOutput) {
        delegate?.handleVMOutput(output)
    }
}
