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

        NavigationStack {
            VStack {
                List {
                    Section {
                        NavigationLink{
                                UITheme()
//                            print("UItheme")
                                .navigationTitle("画面のテーマ")
                        }label: {
                            HStack {
                                Image(systemName: "warninglight")
                                Text("画面のテーマ")
                            }
                        }
                        Text("a")
                    } header: {
                        Label("設定",systemImage: "wrench.and.screwdriver.fill")
                    }
                    
                    // MARK: -公式サイトリンク
                    Section{
                        
                        OfficialLinkButton(iconImage: "x_icon", URLString: "https://x.com/ynu_fes?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor", title: "大学祭実行委員会Twitter")
                        
                        OfficialLinkButton(iconImage: "instagram_icon", URLString: "https://www.instagram.com/ynu_fes/", title: "大学祭実行委員会instagram")
                        OfficialLinkButton(iconImage: "building.columns.fill",URLString: "https://ynu-fes.yokohama/24/tokiwa/", title: "24常盤祭公式HP〜夢灯〜",iconBool: false)
                        
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
        }
//        .padding(1)
    }
}

#Preview {
    tab_setting()
}
