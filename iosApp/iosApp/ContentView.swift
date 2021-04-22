import SwiftUI
import shared

struct ContentView: View {
    let calculator = Calculator.Companion()
    let greet = Greeting().greeting()
    
    @State private var firstIBAN: String = "0"
    @State private var show: Bool = false
    @State private var IBAN: String = "0"

    var body: some View {
        VStack(alignment: .center) {
            Text(greet)
            Spacer()
            VStack(alignment: .center) {
                TextField("IBAN", text: $firstIBAN)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                
                Button("Format", action: {
                    show = true
                    IBAN = String(calculator.getFormattedIban(ibanAsString: firstIBAN))
                }).buttonStyle(DefaultButtonStyle())
                
                Spacer(minLength: 10)
                if show {
                    Text("Formatted Iban").font(.headline)
                    Text(IBAN)
                        .font(.headline)
                    Spacer(minLength: 10)
                }
                Spacer(minLength: 10)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
