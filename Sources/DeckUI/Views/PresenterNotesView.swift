//
//  PresenterView.swift
//  Demo
//
//  Created by Zachary Brass on 1/17/23.
//

import SwiftUI
public struct PresenterNotesView: View {
    @ObservedObject private var presentationState = PresentationState.shared
    @State private var fontSize: CGFloat = 40
    public var body: some View {
        VStack(alignment:.leading){
            Spacer()
            Text(presentationState.deck.slides()[presentationState.slideIndex].comment ?? "No notes")
                .font(.system(size: fontSize))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)

                
            Spacer()
            
//            #if canImport(UIKit)
            HStack{
                Spacer()
                
                Button{
                    fontSize -= 5
                } label : {
                    Text("A")
                }.font(.system(size: 30))

                Button{
                    fontSize += 5
                } label : {
                    Text("A")
                }.font(.system(size: 40))

            }.buttonStyle(.plain)
                .padding(20)
//            #endif
            

        }.frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(.background)
//            .toolbar {
//                ToolbarItem {
//                    Button{
//                        fontSize -= 5
//                    } label : {
//                        Text("A")
//                            .font(.system(size: 15))
//                    }
//                }
//                ToolbarItem {
//
//                    Button{
//                        fontSize += 5
//                    } label : {
//                        Text("A")
//                            .font(.system(size: 20))
//                    }
//                }
//            }

        #if canImport(UIKit)
        .slideNavigationGestures()
        #endif
        
    }
    public init() {
    }
        
    
}
#if canImport(AppKit)
@available(macOS 13.0, *)
public struct PresenterNotes: Scene {
    public var body: some Scene {
        Window("Presenter Notes", id: "notes") {
            PresenterNotesView()
                .toolbar {
                    SlideNavigationToolbarButtons()
                }
        }.keyboardShortcut("1")

    }
    public init() {
    }
}
#endif
