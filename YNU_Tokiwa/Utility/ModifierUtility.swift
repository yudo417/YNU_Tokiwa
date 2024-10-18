//
//  ModifierUtility.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/18.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content:Content) -> some View{
        content
            .frame(maxWidth:.infinity,alignment:.center)
    }
}
