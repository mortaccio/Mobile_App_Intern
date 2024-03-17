//
//  FontStyle.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import Foundation
import SwiftUI

extension Font {
    
    //Product Information Fonts
    static var productTitle: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 18)
    }
    
    static var productDescription: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 12)
    }
    
    static var productActualPrice: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 16)
    }
    
    static var productOldPrice: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 11)
    }
    
    
    //Titles Fonts
    static var informationTitle: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 20)
    }
    
    static var favoritesTitle: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 20)
    }
    
    //Action Buttons Fonts
    static var productSortActionButton: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 12)
    }
    
    static var myCartActionButton: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 13)
            .bold()
    }
    
    static var buyNowActionButton: Font {
        return Font.custom("OpenSans-Italic-VariableFont_wdth,wght", size: 13)
    }
}
