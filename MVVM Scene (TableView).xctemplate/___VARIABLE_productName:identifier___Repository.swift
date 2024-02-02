//  ___FILEHEADER___

import Foundation

class ___VARIABLE_productName:identifier___Repository {
    
    // MARK: - Public Methods
    
    func fetch(completion: @escaping ([String]) -> ()) {
        // Simulated data fetching after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            let items: [String] = [
                "ABC",
                "DEF",
                "GHI"
            ]
            // Invoke completion
            completion(items)
        }
    }
}