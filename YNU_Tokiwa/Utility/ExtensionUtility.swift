//
//  ExtensionUtility.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/18.
//

import SwiftUI

extension View{
    func centered() -> some View{
        self
            .modifier(CenterModifier())
    }
}

