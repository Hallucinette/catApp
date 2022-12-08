//
//  CustList.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 01/12/2022.
//

import SwiftUI

struct CustList: View {
    var pseudo: String
    
    var body: some View {
        
        VStack{
            RoundedRectangle(cornerRadius: 20)
                
                .foregroundColor(.white)
                .frame(width: 300, height: 60)
                .overlay {
                    HStack(){
                        VStack{
                            Circle()
                                .stroke(.pink, lineWidth: 2)
                                .frame(width: 40)
                               // .padding()
                        }
                        Text(pseudo)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
        }
    }
}

struct CustList_Previews: PreviewProvider {
    static var previews: some View {
        CustList(pseudo: "test")
    }
}
