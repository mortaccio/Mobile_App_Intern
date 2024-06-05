import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    @StateObject private var cartViewModel = CartViewModel()
    @State private var showCart = false

    var body: some View {
        NavigationView {

                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    ZStack {
                        ProductListView(cartViewModel: cartViewModel)
                            .padding(.top, 40)
                            .padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .top) {
                        HeaderView {
                            
                        } favoritesMenuAction: {
                            
                        }
                    }
                    
                    // MY CART Button
                    ZStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Button {
                            showCart = true
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.buttons)
                                .overlay {
                                    HStack {
                                        Image("ic-cart")
                                            .frame(width: 24, height: 24)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .colorInvert()
                                        
                                        Text("MY CART")
                                            .foregroundColor(.white)
                                            .font(Font.myCartActionButton)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 85, height: 85)
                                        
                                        Spacer()
                                            .frame(width: 24, height: 24)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding()
                                    }
                                }
                                .frame(width: .infinity, height: 40)
                                .padding(10)
                        }
                        .background(
                            NavigationLink(destination: CartView(viewModel: cartViewModel), isActive: $showCart) {
                                EmptyView()
                            }
                            .hidden()
                        )
                    }
                }
                
            }
        }
        
    }

#Preview {
    ContentView()
}
