//
//  Buttons.swift
//  Neumorphic Buttons
//
//  Created by 林宏諭 on 2021/5/30.


import SwiftUI

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}

struct Buttons: View {
    
    var body: some View {
        VStack(spacing: 80) {
            RectangleButton()
            
            CircleButton ()
            
            PayButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Buttons()
        }
    }
}


struct RectangleButton: View {
    
    @State var tap = false
    @State var press = false
    
    var body: some View {
        Text(press ? "Stop":"Start")
            .foregroundColor(press ? .red:.black)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60)
            .background(ZStack {
                Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.5598025918, green: 0.7296747565, blue: 0.8446390033, alpha: 1))
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .foregroundColor(Color(press ? #colorLiteral(red: 0.5598025918, green: 0.7296747565, blue: 0.8446390033, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .blur(radius: 4)
                    .offset(x: -8, y: -8)
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .padding(2)
                    .blur(radius: 2)
            })
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                HStack {
                    Image(systemName: press ? "stop.fill" : "play.fill")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.white)
                        .frame(width:CGFloat(54), height:CGFloat(54))
                        .background(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)).opacity(0.3), radius: 10, x: 10, y: 10)
                        .offset(x: press ? 155:-10)
                    Spacer()
                }
            )
            .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.5598025918, green: 0.7296747565, blue: 0.8446390033, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(press ? #colorLiteral(red: 0.5598025918, green: 0.7296747565, blue: 0.8446390033, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            .scaleEffect(tap ? 1.2:1)
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 10).onChanged({ value in
                    self.tap = true
                    impact(style: .heavy)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.tap = false
                    }
                })
                .onEnded { value in
                    self.press.toggle()
                    haptic(type: .success)
                }
            )
    }
}

struct CircleButton: View {
    
    @State var tap = false
    @State var press = false
    
    var body: some View {
        
        ZStack {
            Image(systemName: "sun.max")
                .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? -90:0, y: press ? -90:0)
                .rotation3DEffect(
                    Angle(degrees: press ? 20:0),
                    axis: (x: 10, y: -10, z: 0)
                )
            Image(systemName: "moon")
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? 0:90, y: press ? 0:90)
                .rotation3DEffect(
                    Angle(degrees: press ? 0:20),
                    axis: (x: -10, y: 10, z: 0)
                )
            
            
        }
        .frame(width: 100, height: 100)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1):#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Circle()
                    .stroke(Color.clear,lineWidth: 10)
                    .shadow(color: Color(#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1)), radius: 3, x: -5, y: -5)
                Circle()
                    .stroke(Color.clear,lineWidth: 10)
                    .shadow(color: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 3, x: 3, y: 3)
            }
            
        )
        .clipShape(Circle())
        .shadow(color: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
        .shadow(color: Color(#colorLiteral(red: 0.5598025918, green: 0.7296747565, blue: 0.8446390033, alpha: 1)), radius: 20, x: 20, y: 20)
        .scaleEffect(tap ? 1.2:1)
        .gesture(
            LongPressGesture(minimumDuration: 0.5, maximumDistance: 10).onChanged({ value in
                self.tap = true
                impact(style: .heavy)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.tap = false
                }
            })
            .onEnded { value in
                self.press.toggle()
                haptic(type: .success)
            }
        )
        
    }
}

struct PayButton: View {
    
    @GestureState var tap = false
    @State var press = false
    
    var body: some View {
        
        ZStack {
            Image("fingerprint")
                .resizable()
                .frame(width: 70, height: 60)
                .opacity(press ? 0:1)
                .scaleEffect(press ? 0:1)
            
            Image("fingerprint-2")
                .resizable()
                .frame(width: 70, height: 60)
                .clipShape(Rectangle().offset(y:tap ? 0:60))
                .animation(.easeInOut)
                .opacity(press ? 0:1)
                .scaleEffect(press ? 0:1)
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 50, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.9536857009, green: 0.6870167255, blue: 0.1345476508, alpha: 1)))
                .opacity(press ? 1:0)
                .scaleEffect(press ? 1:0)

            
            
        }
        .frame(width: 120, height: 120)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1):#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Circle()
                    .stroke(Color.clear,lineWidth: 10)
                    .shadow(color: Color(#colorLiteral(red: 0.8019031882, green: 0.9499765038, blue: 0.9394686818, alpha: 1)), radius: 3, x: -5, y: -5)
                Circle()
                    .stroke(Color.clear,lineWidth: 10)
                    .shadow(color: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 3, x: 3, y: 3)
            }
            
        )
        .clipShape(Circle())
        .overlay(
            Circle()
                .trim(from: tap ? 0.001:1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9536857009, green: 0.6870167255, blue: 0.1345476508, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7568146586, blue: 0.1564868689, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 88, height: 88)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x:1, y: 0, z: 0)
                )
                .shadow(color: Color(#colorLiteral(red: 0.9536857009, green: 0.6870167255, blue: 0.1345476508, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
                .animation(.easeInOut)
        )
        .shadow(color: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
        .shadow(color: Color(#colorLiteral(red: 0.5598025918, green: 0.7296747565, blue: 0.8446390033, alpha: 1)), radius: 20, x: 20, y: 20)
        .scaleEffect(tap ? 1.2:1)
        .gesture(
            LongPressGesture().updating($tap) { currentState, gestureState,
                transaction in
                gestureState = currentState
                impact(style: .heavy)
            }
            .onEnded { _ in
                self.press.toggle()
                haptic(type: .success)
            }
        )
        
    }
}
