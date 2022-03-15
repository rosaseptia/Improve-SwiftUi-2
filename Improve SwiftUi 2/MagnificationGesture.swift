//
//  MagnificationGesture.swift
//  Improve SwiftUi 2
//
//  Created by Septia Rosalina Malik on 15/03/22.
//

import SwiftUI

struct MagnificationGesture2: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 35, height: 35)
                Text("Learning Swift")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ value in
                            currentAmount = value - 1

                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                currentAmount = 0
                            }
                            
                        }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is caption for my photo!")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        }
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(10))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged{ value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded{ velue in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

struct MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGesture2()
        
    }
}
