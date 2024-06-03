import SwiftUI

struct ProductListView: View {
    @State private var products: [Product] = []
    @State private var currentPage = 1
    @State private var isLoading = false
    @State public var favoriteProducts: Set<Product> = []
    @State private var inCartProducts: Set<Product> = []
    
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(products, id: \.id) { product in
                    VStack {
                        HStack {
                            AsyncImage(url: product.main_image) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 120, height: 100)
                            .cornerRadius(8)
                            
                            VStack {
                                NavigationLink(destination: ProductDetailView(product: product, isFavorite: favoriteProducts.contains(product))) {
                                    Text(product.name.split(separator: " ").prefix(3).joined(separator: " "))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .font(Font.productTitle)
                                .foregroundStyle(Color.black)
                                .padding(.top)
                                .frame(alignment: .center)
                                
                                Text(product.details.split(separator: " ").prefix(5).joined(separator: " "))
                                    .foregroundStyle(Color.details)
                                    .font(Font.productDescription)
                                    .padding(.top)
                                    .aspectRatio(contentMode: .fit)
                                
                                HStack {
                                    Text("$ \(String(format: "%.0f", product.price))")
                                        .font(Font.productActualPrice)
                                        .foregroundStyle(Color.price)
                                    
                                    Text("$ \(String(format: "%.0f", product.price))")
                                        .font(Font.productOldPrice)
                                        .foregroundStyle(Color.oldPrice)
                                }
                                .padding(.top)
                                
                                HStack {
                                    Button(action: {
                                        if favoriteProducts.contains(product) {
                                            favoriteProducts.remove(product)
                                        } else {
                                            favoriteProducts.insert(product)
                                        }
                                    }) {
                                        Image(systemName: favoriteProducts.contains(product) ? "heart.fill" : "heart")
                                    }
                                    .padding(.leading)
                                    
                                    Button(action: {
                                        if inCartProducts.contains(product) {
                                            inCartProducts.remove(product)
                                            cartViewModel.removeFromCart(product: product)
                                        } else {
                                            inCartProducts.insert(product)
                                            cartViewModel.addToCart(product: product)
                                        }
                                    }) {
                                        Image(systemName: inCartProducts.contains(product) ? "cart.fill" : "cart")
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.top)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .onAppear {
                        if self.shouldLoadNextPage(product) {
                            self.loadNextPage()
                        }
                    }
                }
                
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .onAppear {
            self.fetchProducts()
        }
    }
    
    private func shouldLoadNextPage(_ product: Product) -> Bool {
        guard let lastProduct = products.last else {
            return false
        }
        return product.id == lastProduct.id
    }
    
    private func loadNextPage() {
        isLoading = true
        currentPage += 1
        ProductListModel().fetchProducts(page: currentPage, pageSize: 10) { apiResponse, error in
            if let error = error {
                print("Error: \(error)")
            } else if let apiResponse = apiResponse {
                self.products.append(contentsOf: apiResponse.results)
            }
            isLoading = false
        }
    }
    
    private func fetchProducts() {
        isLoading = true
        ProductListModel().fetchProducts(page: currentPage, pageSize: 10) { apiResponse, error in
            if let error = error {
                print("Error: \(error)")
            } else if let apiResponse = apiResponse {
                self.products = apiResponse.results
            }
            isLoading = false
        }
    }
}

#Preview {
    ProductListView(cartViewModel: CartViewModel())
}
