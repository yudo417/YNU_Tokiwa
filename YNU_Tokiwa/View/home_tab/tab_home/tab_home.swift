//
//  tab_home.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

struct tab_home: View {
    var body: some View {
        VStack{
            Image(systemName: "house.fill")
                .resizable()
                .foregroundStyle(.red)
                .frame(width: 50, height: 50)
            Text("home")
        }
    }
}

#Preview {
    tab_home()
}
