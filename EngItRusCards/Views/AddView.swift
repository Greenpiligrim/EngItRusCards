//
//  AddView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 26/09/22.
//

import SwiftUI

struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var listModelView: ListViewModel
    @State var textField: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.app")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(20)
                    }
                    Spacer()
                }
              
                    VStack {
                        TextField("Add your text here", text: $textField)
                            .padding(.horizontal)
                            .frame(height: 55)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(10)
                        Button {
                            saveButtonPressed()
                        } label: {
                            Text("Save".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                    }.padding(14)
               
                    .alert(isPresented: $showAlert) {
                        getAlert()
                    }
            }
        }
    }
    func saveButtonPressed() {
        if textAppropriate(){
            listModelView.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textAppropriate() -> Bool {
        if textField.count < 3 {
            alertTitle = "Needs More Leter "
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
