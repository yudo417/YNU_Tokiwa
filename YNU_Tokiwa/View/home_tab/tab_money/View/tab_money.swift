//
//  tab_money.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/11.
//

import SwiftUI

struct tab_money: View {

    var body: some View {
        NavigationStack {
            ZStack {
                content
                addbutton
            }
            .navigationTitle("レシートを追加")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    tab_money()
}


extension tab_money{

    private var content: some View {
        VStack {
            ScrollView {
                VStack{
                    ForEach(Receipt.MOCKS){ MOCK in
                        moneyCardView(mock: MOCK)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .background(.gray.opacity(0.2))
    }

    private var addbutton: some View{
        VStack(alignment:.trailing){
            Spacer()
            HStack {
                Spacer()
                Button {
                    print("追加ボタン")
                } label: {
                    Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.blue)
                        .padding(10)
                        .background{
                            Circle()
                                .foregroundStyle(.cyan.opacity(0.1))
                        }
                        .padding()
                }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .border(.red)
    }
}
