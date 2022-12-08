//
//  VM1.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation
import SwiftUI

enum ButtonType {
    case Enregistrer, Rejoindre, Création, Rappel, Annuler
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
    if ButtonT == ButtonType.Annuler {
        return "Annuler"
    }

    return "err"
}

//-MARK:

enum color {
    case orangeCust, blueCust
}

func getColor(colorT: color) -> String{
    if colorT == color.orangeCust{
        return "OrangeCust"
    }
    if colorT == color.blueCust{
        return "BlueCust"
    }
    return "err"
}
