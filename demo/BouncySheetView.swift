//
//  BouncyPopupView.swift
//  Test
//
//  Created by PL Smarann Khadka on 15/12/2024.
//
import SwiftUI

struct BouncySheetView: View {
    @State private var showSheet = false
    @State private var sheetOffset: CGFloat = UIScreen.main.bounds.height
    @State private var sliderValue: Double = 0.5
    @State private var isPlaying = false


    var body: some View {
        ZStack(alignment: .bottom) {
            // Main screen content
            VStack {
                Spacer()
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                        showSheet.toggle()
                        sheetOffset = showSheet ? 0 : UIScreen.main.bounds.height
                    }
                }) {
                    Text("Show Player")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }

            VStack {
                // Gradient slider and close button
                VStack {
                    ZStack{
                        
                        VStack{
                            
                        HStack {
                            
                            Image("album") // Replace with your album art image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text("Balenciaga")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16,weight: .heavy))

                                Text("@username")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 115/255, green: 121/255, blue: 133/255, opacity: 1))
                                    .font(.system(size: 16, weight: .regular))
                            }
                           
                            
                            HStack(spacing: 10) {
                                Button(action: {
                                    // Handle previous track button tap
                                }) {
                                    Image("previous")
                                        .foregroundColor(.gray)
                                }
                                
                                Button(action: {
                                    isPlaying.toggle()
                                }) {
                                    Image(isPlaying ? "pause" : "play").resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(.gray)
                                }
                                
                                Button(action: {
                                    // Handle next track button tap
                                }) {
                                    Image("forward")
                                        .foregroundColor(.gray)
                                }
                            }.frame(maxWidth: .infinity)
                                .padding(.leading, 80)
                        }
                        .padding(.horizontal,5).padding(.vertical,5)
                        .background(
                            ZStack(alignment: .top) {
                                Color(red: 19/255, green: 25/255, blue: 31/255, opacity: 1)
                                    .cornerRadius(18)

                                Rectangle()
                                    .fill(Color(red: 0.1725490196, green: 0.2039215686, blue: 0.2352941176, opacity: 2))
                                    .frame(height: 1)
                                    .cornerRadius(1)
                            }
                        )
                        .cornerRadius(18).offset(y: 32)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)

                        
                        VStack{
                            
                            HStack {
                                
                                GradientSlider(value: $sliderValue)
                                    .padding(.leading, 10).padding(.trailing, 20)
                                
                               
                            }.background(Color.clear).offset(y: -46)
                            
                         
                        }
                        
                        }
                    }.shadow(radius: 10).padding(.horizontal,20)
                    HStack{
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showSheet.toggle()
                                sheetOffset = UIScreen.main.bounds.height
                            }
                        }) {
                            Image("closex")
                                .resizable()
                                .padding(12)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 34, height: 34) // Set the size
                                .clipShape(Circle())
                                .background(Color(#colorLiteral(red: 0.07450980392, green: 0.09803921569, blue: 0.1215686275, alpha: 1))) // Add a white background
                                .clipShape(Circle()) // Clip the background to a circle
                                .overlay(
                                    Circle()
                                        .stroke(Color(#colorLiteral(red: 0.1725490196, green: 0.2039215686, blue: 0.2352941176, alpha: 1)), lineWidth: 1) // Add a white border
                                )
                        }.offset(y: -72).padding(.horizontal,14)
                    }
                    }.cornerRadius(20)
                    .background(Color.white)
                    
                }
                .offset(y: sheetOffset)
                .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: sheetOffset)
            }
        }
    }



// Preview
struct BouncySheetView_Previews: PreviewProvider {
    static var previews: some View {
        BouncySheetView()
    }
}
