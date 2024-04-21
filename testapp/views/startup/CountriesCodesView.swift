import SwiftUI

struct CountriesCodesView: View {
    @State private var countries: [Country] = []
    @Binding var selectedCountry: Country
    var onCountrySelected: (Country) -> Void

    var body: some View {
        List(countries, id: \.code) { country in
            HStack {
                Text(country.name)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                selectedCountry = country
                onCountrySelected(country)
            }
        }.padding(0)
        .listStyle(PlainListStyle())
        .onAppear {
            loadJSONData()
        }
    }

    func loadJSONData() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                countries = try JSONDecoder().decode([Country].self, from: data)
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
    }
}

struct Country: Codable, Identifiable {
    let id = UUID()
    let name: String
    let dial_code: String
    let code: String
}

struct TestContentView: View {
    @State var selectedCountry: Country = Country(name: "United States", dial_code: "+1", code: "US")
    
    var body: some View {
        NavigationView {
            CountriesCodesView(selectedCountry: $selectedCountry) { country in
                // Handle the selected country here
                print("Selected Country: \(country.name)")
            }
        }
    }
}

struct CountriesCodesView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView()
    }
}
