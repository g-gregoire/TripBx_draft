//
//  MainTabView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-14.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tabIndex:Int
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        TabView (selection: $tabIndex) {
            
            HomeView()
                .tabItem {
                    VStack{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(0)
            
            SplitListView()
                .tabItem {
                    VStack{
                        Image(systemName: "dollarsign.square")
                        Text("Split")
                    }
                }
                .tag(1)
            
            SquadListView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.3.fill")
                        Text("Squads")
                    }
                }
                .tag(2)
            
            AccountView()
                .tabItem {
                    VStack{
                        //Image(systemName: "line.3.horizontal.circle.fill")person.circle.fill
                        Image(systemName: "person.circle.fill")
                        Text("Account")
                    }
                }
                .tag(3)
            
        }
        .tabViewStyle(.automatic)
        .background(.white)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(tabIndex: 0)
            .environmentObject(TripModel())
    }
}
