//
//  OfficialLink.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/13.
//

import SwiftUI

struct OfficialLink: View {
    @Environment(\.openURL) var openURL
    var iconImage:String
    var URLString:String
    var title:String

    var body: some View {
        Button{
            openURL(URL(string:URLString)!)
            print(URLString)
        }label:{
            HStack {
                Image(iconImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(title)
            }
//                            .clipShape(Circle())
        }
    }
}

#Preview {
    OfficialLink(iconImage: "x_icon", URLString: "https://x.com/ynu_fes?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor", title: "大学祭実行委員")
}
