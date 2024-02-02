//  ___FILEHEADER___

import UIKit

class ___VARIABLE_productName:identifier___Adapter: NSObject {
    
    // MARK: - Properties
    
    private var viewModel: ___VARIABLE_productName:identifier___ViewModel!
    
    // MARK: - Init
    
    init(viewModel: ___VARIABLE_productName:identifier___ViewModel) {
        self.viewModel = viewModel
    }
}

extension ___VARIABLE_productName:identifier___Adapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.uiItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.uiItems[indexPath.item] {
        case .default(let item):
            return tableView
                .dequeue(___VARIABLE_productName:identifier___ItemTableViewCell.self, for: indexPath)
                .configure(for: item)
        }
    }
}

extension ___VARIABLE_productName:identifier___Adapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.uiItems[indexPath.item] {
        case .default(let item):
            // Open detail for item detail selected by the user.
            viewModel.openDetail(item: item)
        }
    }
}
