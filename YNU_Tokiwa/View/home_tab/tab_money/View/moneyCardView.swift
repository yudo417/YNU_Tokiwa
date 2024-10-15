//
//  moneyCardView.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/15.
//

import SwiftUI

struct moneyCardView: View {
    let mock: Receipt
    var body: some View {
        let receipts = Receipt.MOCKS
        HStack{
            Spacer()
            VStack(alignment:.center,spacing: 5){
                Text(mock.ShopName)
                    .font(.largeTitle)
                    .bold()
                Divider()
                Text("¥"+mock.value)
                    .font(.title)
            }

            Spacer()
            Button{
                print("削除ボタン")
            }label: {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.blue)
            }
        }
        .frame(width: .infinity, height: 100)
        .padding(.horizontal)
        .border(.red)
    }
}

#Preview {
    moneyCardView(mock: Receipt(id: "1", ShopName: "Test", value: "10000"))
}
