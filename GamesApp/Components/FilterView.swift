//
//  FilterView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 24.05.2023.
//

import SwiftUI


struct FilterView: View {
    
    @Binding var selectedOrder: SortOrders
    @Binding var selectedPlatform: FilterPlatforms
    @EnvironmentObject var vm: ViewModel
    @State var view: ViewsEnum
    var body: some View {
            HStack {
                HStack(spacing: 0) {
                    Text("Order by:")
                        .foregroundColor(Color.white)
                    Picker("Order by:", selection: $selectedOrder) {
                        ForEach(SortOrders.allCases, id: \.self) { option in
                            HStack {
                                Image(systemName: option.ordersOrder)
                                    .frame(width: 16, height: 16)
                                Text(option.ordersTitle)
                                    .accentColor(Color.white)
                            }
                        }
                    }
                    .accentColor(Color.white)
                    .pickerStyle(.menu)
                    
                    .onChange(of: selectedOrder) { option in
                      //  vm.setDefaultQuerry(page: true, sorting: false)
                        vm.handleSelectionChange(option: option, view: view)
                        vm.clearGames(forView: view)
                        vm.isLoading = true
                    }
                }
                
                .padding(.horizontal, 4)
                .background(Color.init(white: 0.20))
                .cornerRadius(5)
                
                HStack(spacing:0) {
                    Picker("Platforms:", selection: $selectedPlatform) {
                        ForEach(FilterPlatforms.allCases, id: \.self) { option in
                            Text(option.platformsTitles)
                                .fontWeight(.bold)
                                .accentColor(Color.white)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedPlatform) { option in
                        print("Platform changed: \(option)")
                        vm.isLoading = true
                    }
                    .accentColor(Color.white)
                }
                .padding(.horizontal, 4)
                .background(Color.init(white: 0.20))
                .cornerRadius(5)
                
                Spacer()
                
            }
            .padding(.horizontal, 8)
        }
}

struct FilterView_Previews: PreviewProvider {
    @State static var selectedOrder: SortOrders = .popularity
    @State static var selectedPlatform: FilterPlatforms = .pc
    @State static var isLoading: Bool = true
    @StateObject static var viewModel = ViewModel(networkService: NetworkService())

    static var previews: some View {
        FilterView(selectedOrder: $selectedOrder, selectedPlatform: $selectedPlatform, view: .newAndTrending)
            .environmentObject(viewModel)
    }
}

