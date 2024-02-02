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

extension ___VARIABLE_productName:identifier___Adapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.uiItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.uiItems[indexPath.item] {
        case .default(let item):
            return collectionView
                .dequeue(___VARIABLE_productName:identifier___ItemCollectionViewCell.self, for: indexPath)
                .configure(for: item)
        }
    }
}

extension ___VARIABLE_productName:identifier___Adapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewModel.uiItems[indexPath.item] {
        case .default(let item):
            // Open detail for item detail selected by the user.
            viewModel.openDetail(item: item)
        }
    }
}