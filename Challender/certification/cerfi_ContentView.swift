//
//  ContentView.swift
//  certificationn
//
//  Created by 김하은 on 2021/08/12.
//

import SwiftUI

struct cerfi_ContentView: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink(
                // 알림창
                destination: noticeView(),
                label: {
                    Image(systemName: "bell")
                })
                .navigationTitle("챌린지 목록")
                
                Button("인증하기") {
                    self.showSheet = true
                }.padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"),
                                message: Text("Choose"), buttons: [.default(Text("Photo Library")) {
                                    // open photo library
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Camera")) {
                                    //open camera
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                },
                                .cancel()
                            ])
                }
            }
            
            .navigationBarTitle("인증")
        }.sheet(isPresented: $showImagePicker) {
            Text("MODAL")
        }
    }
}

// 알림창
struct noticeView: View {
    var body: some View {

        // 목록 보이기 -> List에 넣기
       List{
           Text("one")
           Text("two")
           Text("three")
       }
    }
}

struct cerfi_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        cerfi_ContentView()
    }
}
