//
//  tab_setting.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

struct tab_setting: View {
    @Environment(\.openURL) var openURL
    var body: some View {

        VStack {
            List {
                Section {
                    Text("a")
                    Text("a")
                } header: {
                    Label("設定",systemImage: "wrench.and.screwdriver.fill")
                }

                Section{


                    Button{
//                        openURL(URL(string: "https://x.com/ynu_fes?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor")!)
                        print("xが押された")
                    }label:{
                        HStack {
                            Image("x_icon")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("大学祭実行委員会Twitter")
                        }
//                            .clipShape(Circle())
                    }

                }header: {
                    HStack{
                        Image(systemName: "link.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.primary,.blue)
                        Text("公式リンク")
                    }
                }
            }
//            .listStyle(.grouped)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 50) // TabBarと重ならないようにスペースを確保
        }
//        .padding(1)
    }
}

#Preview {
    tab_setting()
}
