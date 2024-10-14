//
//  UITheme.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/14.
//

import SwiftUI

enum isDarkMode: Int{
    case light = 0
    case dark = 1
    case phone = 2

    var colorScheme: ColorScheme? {
        switch self {
            case .phone:
                return .none
            case .light:
                return .light
            case .dark:
                return .dark
            }
        }
}


struct UITheme: View {
    @State var isPresent : isDarkMode = .phone
    @Environment(\.dismiss) var dismiss
    @AppStorage("UItheme") var UItheme: isDarkMode = .phone

    var body: some View {
        List{
            Section{
                Button{
                    isPresent = .light
                }label: {
                    HStack {
                        Label("ライトモード", systemImage: "sun.max.circle")
                        Spacer()
                        isChecked(isPresent: isPresent, Presented: .light)
                    }
                    .padding(.trailing)
                }
                Button{
                    isPresent = .dark
                }label: {
                    HStack {
                        Label("ダークモード", systemImage: "moon.stars.circle")
                        Spacer()
                        isChecked(isPresent: isPresent, Presented: .dark)
                    }
                    .padding(.trailing)
                }
                Button{
                    isPresent = .phone
                }label: {
                    HStack {
                        Label("本体の設定", systemImage: "iphone.gen1.circle")
                        Spacer()
                        isChecked(isPresent: isPresent, Presented: .phone)
                    }
                    .padding(.trailing)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .foregroundStyle(.primary)
//                        Text("戻る")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    UITheme()
}


extension UITheme{
    @ViewBuilder
    func isChecked(isPresent: isDarkMode ,Presented: isDarkMode) -> some View{
        return Image(systemName: isPresent == Presented ? "checkmark.circle.fill" : "circle.slash")
            .foregroundStyle(.blue)
    }
}
