//
//  tab_money.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/11.
//

import SwiftUI

struct tab_money: View {
    var body: some View {
        VStack{
            Image(systemName: "yensign.arrow.circlepath")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(.blue)
            Text("menu")
        }
    }
}

#Preview {
    tab_money()
}
