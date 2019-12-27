import UIKit
import Foundation

class MainViewModel {
    
    private var buttonModels: [SelectionItemModel] {
        var models = [
            SelectionItemModel(title: "Reports", image: Images.board),
            SelectionItemModel(title: "Files", image: Images.file),
            SelectionItemModel(title: "Gestures", image: Images.hand),
            SelectionItemModel(title: "Sports", image: Images.shoe),
            SelectionItemModel(title: "Weather", image: Images.temp)
        ]
        
        // mark random element as selected
        let random = Int.random(in: 0..<models.count)
        models[random].isSelected = true
       
        return models
    }
    
    // configuration for SelectionView
    func selectionConfig(multiple: Bool) -> SelectionViewConfiguration {
        return SelectionViewConfiguration(
            options: buttonModels,
            selectedColor: selectionColor,
            unselectedColor: .white,
            multipleSelection: multiple
        )
    }
    
    // main view background color
    var backgroundColor: UIColor {
        return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    // main accent color
    var selectionColor: UIColor {
        return  UIColor(red: 53/255, green: 59/255, blue: 81/255, alpha: 1)
    }
}
