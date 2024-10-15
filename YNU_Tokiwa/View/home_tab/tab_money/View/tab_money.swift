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
            ForEach(Receipt.MOCKS){ MOCK in
                moneyCardView(mock: MOCK)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    tab_money()
}
