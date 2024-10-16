//
//  ContentView.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

enum tabColor{
    case home
    case cal
    case bookmark
    case setting
    case search
}


struct ContentView: View {

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
        UITabBar.appearance().standardAppearance = appearance

    }

    @State var home_tab: tabColor = .home
    var body: some View {
        VStack{
            ZStack {
                TabView(selection: $home_tab){
                    tab_money()
                        .tabItem {
                            Label("Cal",systemImage: "yensign.arrow.circlepath")
                                .background(.gray.opacity(0.5))
                        }
                        .tag(tabColor.cal)

                    tab_serach()
                        .tabItem {
                            Label("Search",systemImage: "doc.text.magnifyingglass")
                                .background(.gray.opacity(0.5))
                        }
                        .tag(tabColor.search)

                    tab_home()
                        .tabItem {
                            Label("Home",systemImage: "house.fill")
                        }
                        .tag(tabColor.home)
                    
                    
                    tab_bookmark()
                        .tabItem {
                            Label("Bookmark",systemImage: "bookmark")
                        }
                        .tag(tabColor.bookmark)
                    tab_setting()
                        .tabItem {
                            Label("Others",systemImage: "book.and.wrench")
                        }
                        .tag(tabColor.setting)

                    
                    
                }
                .accentColor(tab_color)
            }
        }
//        .padding()

    }
}

#Preview {
    ContentView()
}




extension ContentView{
    private var tab_color: Color{
        switch home_tab {
        case .home:
            return .red
        case .bookmark:
            return .blue
        case .cal:
            return .yellow
        case .setting:
            return .primary
        case .search:
            return .blue
//        default:
//            return .blue
        }
    }
}
