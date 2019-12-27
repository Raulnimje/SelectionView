import UIKit
import Foundation

struct MainViewModel {
    private var buttonModels: [ButtonViewModel] {
        return [
            ButtonViewModel(title: "Reports", image: Images.board, isSelected: true),
            ButtonViewModel(title: "Files", image: Images.file),
            ButtonViewModel(title: "Gestures", image: Images.hand),
            ButtonViewModel(title: "Sports", image: Images.shoe),
            ButtonViewModel(title: "Weather", image: Images.temp)
        ]
    }
    
    func selectionViewModel(multiple: Bool) -> SelectionViewModel {
        return SelectionViewModel(
            options: buttonModels,
            selectedColor: selectionColor,
            unselectedColor: .white,
            multipleSelection: multiple
        )
    }
    
    var backgroundColor: UIColor {
        return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    var selectionColor: UIColor {
        return UIColor(red: 53/255, green: 59/255, blue: 81/255, alpha: 1)
    }
}
