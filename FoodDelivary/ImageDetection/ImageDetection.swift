//
//  ImageDetection.swift
//  FoodDelivary
//
//  Created by Chohan on 09/03/2024.
//

import SwiftUI

struct ImageDetection: View {
    @State var isPresenting = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    @Environment (\.dismiss) var dissmiss
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button(action: {
                    dissmiss()
                }, label: {
                    Image(systemName: "cross")
                })
                Spacer()
                    .frame(maxWidth: .infinity)
                Image(systemName: "photo")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .photoLibrary
                    }
                Spacer()
                    .frame(maxWidth: .infinity)
                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera
                    }
//                Spacer()
//                    .frame(maxWidth: .infinity)
            }
            .font(.title)   
            .foregroundColor(.blue)
//            .padding(.horizontal, 15)
            Rectangle()
                .strokeBorder()
                .foregroundColor(.yellow)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFill()
                        }
                    }
                )
            
            VStack{
                Button(action: {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }) {
                    Image(systemName: "arrow.down")
                        .foregroundColor(.black)
                        .font(.title)
                }
                Group {
                    if let imageClass = classifier.imageClass {
                        HStack{
                            Text("Image Detection:")
                            Text(imageClass)
                                .bold()
                        }
                    } else {
                        HStack{
                            Text("Image Detection : .....!")
                                .bold()
                        }
                    }
                }
                .font(.subheadline)
                .padding()
            }
        }
        .padding()
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
            
        }
    }
}

#Preview {
    ImageDetection(classifier: ImageClassifier())
}
