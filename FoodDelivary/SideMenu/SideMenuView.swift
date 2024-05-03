//
//  SideMenuView.swift
//  FoodDelivary
//
//  Created by Chohan on 01/02/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SideMenuView: View {
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    @State var image: Image? = Image("")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    var body: some View {
        HStack {
                   
                   ZStack{
                       Rectangle()
                           .fill(.white)
                           .frame(width: 270)
                           .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                       
                       VStack(alignment: .leading, spacing: 0) {
                           ProfileImageView()
                               .frame(height: 140)
                               .padding(.bottom, 30)
                           
                           ForEach(SideMenuRowType.allCases, id: \.self){ row in
                               RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                                   selectedSideMenuTab = row.rawValue
                                   presentSideMenu.toggle()
                               }
                           }
                           
                           Button(action: {
                           logOut()
                           }, label: {
                               ZStack {
                                   Rectangle()
                                       .frame(width: 90, height: 50)
                                       .cornerRadius(10)
                                   Text("LogOut")
                                       .foregroundColor(.white)
                               }
                           })
                           .foregroundColor(.orange)
                           .padding(.vertical)
                           .padding(.horizontal, 60)
                           Spacer()
                       }
                       .padding(.top, 100)
                       .frame(width: 270)
                       .background(
                           Color.white
                       )
                   }
                   Spacer()
               }
               .background(.clear)
        
           }
    
    
           
           func ProfileImageView() -> some View {
               VStack(alignment: .center){
                   HStack(spacing: 0) {
                       Spacer()
//                       Image(systemName: "person")
//                           .resizable()
//                           .aspectRatio(contentMode: .fill)
//                           .frame(width: 100, height: 100)
//                           .overlay(
//                               RoundedRectangle(cornerRadius: 50)
//                                   .stroke(.purple.opacity(0.5), lineWidth: 10)
//                           )
//                           .cornerRadius(50)
                       VStack {
                           image?
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 70, height: 70)
                               .clipShape(Circle())
                               .overlay(Circle().stroke(Color.white, lineWidth: 4))
                               .shadow(radius: 10)
                               .onTapGesture { self.shouldPresentActionScheet = true }
                               .sheet(isPresented: $shouldPresentImagePicker) {
                                   SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                               }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                                   ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                                       self.shouldPresentImagePicker = true
                                       self.shouldPresentCamera = true
                                   }), ActionSheet.Button.default(Text("Photo Library"), action: {
                                       self.shouldPresentImagePicker = true
                                       self.shouldPresentCamera = false
                                   }), ActionSheet.Button.cancel()])
                               }
                           Text("Add Photo")
                       }
                       Spacer()
                   }
                   Text("Hammad")
                       .font(.system(size: 18, weight: .bold))
                       .foregroundColor(.black)
                   
                   Text("IOS Developer")
                       .font(.system(size: 14, weight: .semibold))
                       .foregroundColor(.black.opacity(0.5))
               }
           }
    func logOut() {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("already LoggOut")
        }
        UserDefaults.standard.set(false, forKey: "signIn")
    }
           
           func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
               Button{
                   action()
               } label: {
                   VStack(alignment: .leading){
                       HStack(spacing: 20){
                           Rectangle()
                               .fill(isSelected ? .purple : .white)
                               .frame(width: 5)
                           
                           ZStack{
                               Image(imageName)
                                   .resizable()
                                   .renderingMode(.template)
                                   .foregroundColor(isSelected ? .black : .gray)
                                   .frame(width: 26, height: 26)
                           }
                           .frame(width: 30, height: 30)
                           Text(title)
                               .font(.system(size: 14, weight: .regular))
                               .foregroundColor(isSelected ? .black : .gray)
                           Spacer()
                       }
                   }
               }
               .frame(height: 50)
               .background(
                   LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
               )
               
               
    }
}

#Preview {
    SideMenuView(selectedSideMenuTab: .constant(4), presentSideMenu: .constant(false))
}
