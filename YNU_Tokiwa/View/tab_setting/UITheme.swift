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
                return nil
            case .light:
                return .light
            case .dark:
                return .dark
            }
        }
}


struct UITheme: View {
//    @State var UItheme : isDarkMode = .phone
    @Environment(\.dismiss) var dismiss
    @AppStorage("UItheme") var UItheme: isDarkMode = .phone

    var body: some View {
        List{
            Section{
                Button{
                    UItheme = .light
                }label: {
                    HStack {
                        Label("ライトモード", systemImage: "sun.max.circle")
                        Spacer()
                        isChecked(UItheme: UItheme, Presented: .light)
                    }
                    .padding(.trailing)
                }
                Button{
                    UItheme = .dark
                }label: {
                    HStack {
                        Label("ダークモード", systemImage: "moon.stars.circle")
                        Spacer()
                        isChecked(UItheme: UItheme, Presented: .dark)
                    }
                    .padding(.trailing)
                }
                Button{
                    UItheme = .phone
//                    DispatchQueue.main.async {
//                            UIApplication.shared.windows.first?.rootViewController?.view.setNeedsLayout()
//                        }
                }label: {
                    HStack {
                        Label("本体の設定", systemImage: "iphone.gen1.circle")
                        Spacer()
                        isChecked(UItheme: UItheme, Presented: .phone)
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
//        Text("現在のテーマ: \(UItheme.colorScheme)")
//            .padding()

    }
}

#Preview {
    UITheme()
}


extension UITheme{
    @ViewBuilder
    func isChecked(UItheme: isDarkMode ,Presented: isDarkMode) -> some View{
        Image(systemName: UItheme == Presented ? "checkmark.circle.fill" : "circle.slash")
            .foregroundStyle(.blue)
    }
}
