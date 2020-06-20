//
//  ListSectionGroupView.swift
//  FileMultiList
//
//  Created by Mohammed Abunada on 2020-06-17.
//  Copyright © 2020 NMDS. All rights reserved.
//

import SwiftUI

struct ListSectionGroupView: View {
    var body: some View {
        NavigationView {
            List (){
                Section(header: Text("VStack")
                    .font(.body)) {
                        VStack{
                            Text("1")
                            Text("2")
                            Text("3")
                            Text("4")
                            Text("5")
                            Text("6")
                            Text("7")
                            Text("8")
                            Text("9")
                            Text("10")
//                             Text("11")
                        }
                        .padding(.leading,50)
                        .font(.caption)
                        VStack{
                            Text("11")
                            Text("12")
                            Text("13")
                        }
                        .padding(.leading,50)
                        .font(.body)
                }//Section
                
                Section(header: Text("Grouping")
                    .font(.body)) {
                        Group{
                            Text("1")
                            Text("2")
                            Text("3")
                            Text("4")
                            Text("5")
                            Text("6")
                            Text("7")
                            Text("8")
                            Text("9")
                            Text("10")
//                             text("11")
                        }//Group
                            .padding(.leading,50)
                            .font(.headline)
                        Group{
                            Text("11")
                            Text("12")
                            Text("13")
                        }//Group
                            .padding(.leading,50)
                            .font(.largeTitle)
                }//Section
            }//List
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Fix adding more than 10 items in the list", displayMode: .inline)
            
        }//NavigationView
    }//body
}//ListSectionGroupView

struct ListSectionGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ListSectionGroupView()
    }
}
