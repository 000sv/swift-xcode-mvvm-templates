//  ___FILEHEADER___

import Foundation

enum ___VARIABLE_productName:identifier___UIState {
    case loading
    case insert(IndexPath)
    case remove(IndexPath)
    case openDetail(String)
    case completed
    case error(String)
}