//
//  VM1.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation

enum ButtonType {
    case Enregistrer, Rejoindre, Création, Rappel
    case FinirLaPartie, RetourAuMenu, Suivant, Valider
}

func getButtonType(ButtonT: ButtonType) -> String {
    if ButtonT == ButtonType.Enregistrer {
        return "Enregistrer"
    }
    if ButtonT == ButtonType.Rejoindre {
        return "Rejoindre"
    }
    if ButtonT == ButtonType.Création {
        return "Création"
    }
    if ButtonT == ButtonType.Rappel {
        return "Rappel"
    }
    if ButtonT == ButtonType.FinirLaPartie {
        return "Finir la partie"
    }
    if ButtonT == ButtonType.RetourAuMenu {
        return "Retour au menu"
    }
    if ButtonT == ButtonType.Suivant {
        return "Suivant"
    }
    if ButtonT == ButtonType.Valider {
        return "Valider"
    }

    return "err"
}

// *************************************** //

enum color {
    case orange, blue
}

func getColor(colorT: color) -> String{
    if colorT == color.orange{
        return "orangeCust"
    }
    if colorT == color.blue{
        return "BleuCust"
    }
    return "err"
}
//extension Color {
//    static let orangeCust = Color("orangeCust")
//    static let blueCust = Color("BleuCust")
//}
