//
//  TestView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 19/09/22.
//

import SwiftUI


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {saveItems()}
    }
    let itemKey: String = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int ){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {

        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.apdateCompletion()
        }
    }
    
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
    
    
}
 
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
   
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
    }
    
    func apdateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
        
    }
    
  
}

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NotItemsView()
                    .transition(AnyTransition.opacity.animation((.easeIn)))
            } else {
                List {
                    ForEach(listViewModel.items){ item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
   
    
}


struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct AddTestView: View {
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var listModelView: ListViewModel
    @State var textField: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
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
        }.navigationTitle("Add an Item 🖊")
            .alert(isPresented: $showAlert) {
                getAlert()
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

struct NotItemsView: View {
    let secondaryAccentColor = Color("SecondaryAccentColor")
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("There are not items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you showld click the add button and add a bunch of titles to your todo list")
                    .padding(20)
                NavigationLink("Add someshing 🫡") {
                    AddView()
                }.foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal,animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

