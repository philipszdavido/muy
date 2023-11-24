import SwiftUI

struct SwipeViewTest: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    SwipeRowView(item: item)
                }
                .onDelete { indexSet in
                    items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Swipe Example")
        }
    }
}

struct SwipeRowView: View {
    let item: String
    @State private var isShowingIcon = false

    var body: some View {
        HStack {
            Text(item)
            Spacer()
            if isShowingIcon {
                Image(systemName: "trash.fill")
                    .foregroundColor(.red)
                    .onTapGesture {
                        // Handle your swipe action here
                    }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            // Handle tap action
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation {
                        isShowingIcon = value.translation.width < -50
                    }
                }
                .onEnded { value in
                    withAnimation {
                        isShowingIcon = false
                    }
                }
        )
    }
}

struct SwipeRightView: View {
    @State private var isShowingIcon = false

    var body: some View {
        HStack {
            if isShowingIcon {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
                    .onTapGesture {
                        // Handle your swipe action here
                        print("Swiped right!")
                    }
            }

            Text("Swipe to reveal")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width > 50 {
                                withAnimation {
                                    isShowingIcon = true
                                }
                            } else {
                                withAnimation {
                                    isShowingIcon = false
                                }
                            }
                        }
                        .onEnded { value in
                            withAnimation {
                                isShowingIcon = false
                            }
                        }
                )
        }
        .padding()
    }
}



struct SwipeViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwipeRightView()
    }
}
