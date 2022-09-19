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
        
        TabView (selection: $tabIndex){
            
            SquadListView()
                .tabItem {
                    VStack{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(0)
            
            TripListView()
                .tabItem {
                    VStack{
                        Image(systemName: "sun.max.fill")
                        Text("Trips")
                    }
                }
                .tag(1)
            
            AlbumView()
                .tabItem {
                    VStack{
                        Image(systemName: "dollarsign.square")
                        Text("Split")
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
        
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(tabIndex: 0)
            .environmentObject(TripModel())
    }
}
