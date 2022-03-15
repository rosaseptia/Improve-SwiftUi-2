//
//  LongPressGesture.swift
//  Improve SwiftUi 2
//
//  Created by Septia Rosalina Malik on 15/03/22.
//

import SwiftUI

struct LongPressGesture: View {
    @State var isComplete : Bool = false
    @State var isSuccess : Bool = false
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
            HStack{
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                    // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        //at the main duration
                        withAnimation(.easeOut(duration: 1.0)) {
                            isSuccess = true
                        }
                    }
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture (minimumDuration: 1.0, maximumDistance: 1)
//        {
//            isComplete.toggle()
//        }
        
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
