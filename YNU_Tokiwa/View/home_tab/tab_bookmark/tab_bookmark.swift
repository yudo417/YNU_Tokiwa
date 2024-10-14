//
//  tab_menu.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

struct tab_bookmark: View {
    var body: some View {
        VStack{
            Image(systemName: "bookmark")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(.blue)
            Text("menu")
        }
    }
}

#Preview {
    tab_bookmark()
}
