//
//  Protocols.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 18.06.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
}

protocol HomeViewModelDelegate: AnyObject {
    func handleVMOutput(_ event: HomeViewModelOutput)
}

enum HomeViewModelOutput {
    case yourNewIssues([MTCharacter])
    case previews([MTCharacter])
    case basedOnPreferences([MTCharacter])
    case showErrorMessage(String)
}

enum Sections: Int {
    case YourNewIssues = 0
    case Previews = 1
    case BasedOnYourPreferences = 2
}
