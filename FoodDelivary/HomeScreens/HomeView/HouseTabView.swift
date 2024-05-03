//
//  HouseTabView.swift
//  FoodDelivary
//
//  Created by Chohan on 31/01/2024.
//

import SwiftUI

struct HouseTabView: View {
    
    @State private var searchText = ""
    @State private var presentSheet = false
//    let item : FoodItem
    
    let foodItems: [FoodItem] = {
        guard let url = Bundle.main.url(forResource: "food", withExtension: "json") else {
            fatalError("Failed to locate food.json file")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode([String: [FoodItem]].self, from: data)
            return result["food_items"] ?? []
        } catch {
            fatalError("Failed to decode dummy.json file: \(error)")
        }
    }()
    
    @StateObject var location = LocationManager()
    
    //    @StateObject var foodDataDecode = DecodeFile()
    //    var foodItem: [FoodItem] = []
    @Binding var presentSideMenu: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1)
                    .ignoresSafeArea(.all)
                VStack {
                    HStack{
                        Button{
                            presentSideMenu.toggle()
                        } label: {
                            Image("menu")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        
                        Spacer()
                        Text(location.userLocation == nil ? "Locating..." : "Delivary To")
                            .lineLimit(0)
                        Text(location.userAddress)
                            
                        Spacer()
                        Button(action: {
                            presentSheet.toggle()
                        }, label: {
                            Image("AI")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(.circle)
                                .padding(5)
                                .cornerRadius(7)
                        })
                        .fullScreenCover(isPresented: $presentSheet) {
                            ImageDetection(classifier: ImageClassifier())
                        }
                    }
                    .padding(.horizontal)
                    .background(Color.orange.opacity(0.25))
                    HStack {
                        Text("Enjoy Delicious food")
                            .font(.system(size: 25))
                            .padding(.horizontal)
                            .bold()
                        Spacer()
                    }
                    
                    List(foodItems) { item in
                        NavigationLink(destination: FoodItemDetail(item: item)) {
                                FoodItemRow(item: item)
                        }
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                    .buttonStyle(BorderlessButtonStyle())
                }
                Spacer()
            }
        }
        .onAppear {
            location.locationManager.delegate = location
        }
    }
}

#Preview {
    HouseTabView(presentSideMenu: .constant(false))
}
