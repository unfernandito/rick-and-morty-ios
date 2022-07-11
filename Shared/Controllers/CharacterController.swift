//
//  CharacterController.swift
//  rick-and-morty-app
//
//  Created by luis.betancourt on 07/07/2022.
//

import Foundation
import SwiftUI

final class CharacterController {
    func getCharacterStatus(status: String) -> Color {
        switch status {
            case "unknown":
                return Color.black
            case "Alive":
                return Color.green
            case "Dead":
                return Color.red
            default:
                return Color.red
        }
    }
}
