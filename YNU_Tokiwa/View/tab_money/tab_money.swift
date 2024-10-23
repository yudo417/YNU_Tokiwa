//
//  tab_money.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/11.
//

import SwiftUI

struct tab_money: View {
    @State var isadd: Bool = false
    @ObservedObject var  mvm = MoneyViewModel()//@publishに変更があった場合再描画
    var body: some View {

        NavigationStack {
            ZStack {
                content
                subField
            }
            .navigationTitle("レシート一覧")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isadd) {
            addView(mvm: mvm)
        }
        .onAppear{
            //            mvm.receipts = mvm.loadReceipts()
            print("nowdata:\(mvm.receipts)")
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

                    ForEach(mvm.receipts){ MOCK in
                        moneyCardView(mock: MOCK){  receipt in
                            mvm.deleteReceipt(receipt)
                        }
                        .padding(.horizontal)

                    }
                }
            }
//            Rectangle()
//                .frame(height: 80)
            .padding(.bottom,80)
        }
        .background(.gray.opacity(0.2))
    }

    private var subField: some View{
        VStack(alignment:.trailing,spacing:0){
            Spacer()
            HStack(spacing:0){
                Label("合計:", systemImage: "cart")
                    .font(.title)
                Spacer()
                Text("¥"+String(mvm.sum))
                    .font(.title)
                Spacer()
                Button {
                    isadd = true
                } label: {
                             Image(systemName: "pencil.tip.crop.circle.badge.plus")
                                 .resizable()
                                 .frame(width: 60, height: 60)
                                 .foregroundStyle(.blue)
                    .padding(10)
                }
                .buttonStyle(.plain)
                
            }
            .padding(10)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //                .border(.red)
    }
}
