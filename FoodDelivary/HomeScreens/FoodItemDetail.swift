//
//  FoodItemDetail.swift
//  Food Delivery


import Foundation
import SwiftUI
import CachedAsyncImage

struct FoodItemDetail: View {
    
    @State private var count: Int = 0
    
    let item: FoodItem
    
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 1)
                .ignoresSafeArea(.all)
            VStack {
                ZStack{
                    Rectangle()
                        .frame(width: 258, height: 224)
                        .foregroundColor(.gray.opacity(0.5))
                        .cornerRadius(10)
                    
                    CachedAsyncImage(url: URL(string: item.image),transaction: Transaction(animation: .easeInOut)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        } else {
                            HStack {
                                Spacer()
                                Image(systemName: "photo")
                                    .foregroundColor(.white)
                                    .imageScale(.large)
                                Spacer()
                            }
                        }
                    }
                    
                }
                .padding(.top, 30)
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 50)
                        .cornerRadius(30)
                        .foregroundColor(.orange)
                    HStack {
                        Button(action: {
                            
                            count -= 1
                            if count < 0 {
                                count = 0
                            }
                        }, label: {
                            Text("-")
                                .foregroundColor(.white)
                        })
                        
                        Text("\(count)")
                            .foregroundColor(.white)
                        Button(action: {
                            count += 1
                        }, label: {
                            Text("+")
                                .foregroundColor(.white)
                        })
                    }
                }
                Text("\(item.price * count)")
                
                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Button(action: {
                    NotificationCenter.default.post(name: .taskAddedNotification, object: item)
                }) {
                    Text("Add to Cart ")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .frame(width: 335, alignment: .top)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.98, green: 0.53, blue: 0.12), location: 0.00),
                                    Gradient.Stop(color: Color(red: 1, green: 0.47, blue: 0.3), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.42, y: -0.3),
                                endPoint: UnitPoint(x: 0.54, y: 1.54)
                            )
                        )
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.79, green: 0.26, blue: 0.07).opacity(0.1), radius: 15, x: 0, y: 10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    FoodItemDetail(item: FoodItem(name: "Food", description: "", price: 1, image: ""))
}
