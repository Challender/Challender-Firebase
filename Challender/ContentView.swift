//
//  ContentView.swift
//  Challender
//
//  Created by gibeom on 2021/08/10.
//

import SwiftUI
import FirebaseStorage

struct ContentView: View {
    @ObservedObject private var viewModel = userViewModel()
    let storage = Storage.storage() // Storage 인스턴스
    
    func uploadImage(img:UIImage){
        var data = Data()
        data = img.jpegData(compressionQuality: 0.8)! // 이미지를 jpegData로 변경
        let filepath = "password" // 저장 경로
        let metaData = StorageMetadata() // 저장 될 파일 유형
        metaData.contentType = "image/png"
        storage.reference().child(filepath).putData(data, metadata: metaData){ // 데이터 넣기
            (metaData, error) in if let error = error {
                print(error.localizedDescription)
                return
            }else{
                print("성공")
            }
        }
    }
    
    func buttonEvent(){
        let image = UIImage(named: "1.png")
        uploadImage(img: image!)
    }
    
    var body: some View {
        NavigationView {
            Button(action: buttonEvent){
                Text("버튼")
            }
            List(viewModel.users) { user in
                VStack(alignment: .leading) { // 행
                    Text(user.name).font(.title)
                    Text(user.surname).font(.subheadline)
                }
            }.navigationBarTitle("Users")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
