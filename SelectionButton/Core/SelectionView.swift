import UIKit

class SelectionView: UIView {
    
    private var buttons: [ButtonView] = []
    private let stackContainer = UIStackView(forAutoLayout: ())
    
    var viewModel: SelectionViewModel? {
        didSet {
            if let model = viewModel {
                fillData(model: model)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

private extension SelectionView {
    func setupView() {
        addSubview(stackContainer)
        
        let margin = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        stackContainer.autoPinEdgesToSuperviewEdges(with: margin)
        
        stackContainer.axis = .horizontal
        stackContainer.spacing = 8
        stackContainer.distribution = .fillEqually
    }
    
    func fillData(model: SelectionViewModel) {
        stackContainer.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let options = model.options.map { option -> ButtonViewModel in
            var newOption = option
            
            newOption.selectedColor = model.selectedColor
            newOption.unselectedColor = model.unselectedColor
            
            return newOption
        }
        
        buttons = createButtonViews(models: options)
        buttons.forEach { (button) in
            stackContainer.addArrangedSubview(button)
        }
    }
    
    func createButtonViews(models: [ButtonViewModel]) -> [ButtonView] {
        return models.map { model in
            let button = ButtonView(forAutoLayout: ())
            button.viewModel = model
            
            button.onTouch = { [weak self] in
                self?.itemSelected(model)
            }
            
            return button
        }
    }
}

private extension SelectionView {
    func itemSelected(_ model: ButtonViewModel) {
        // if multiselection is disabled
        // then just mark as selected the model
        // and disbale the rest
        let multiple = viewModel?.multipleSelection ?? false
        
        guard multiple else {
            return markAsSelected(model)
        }
        
        // if multiselection is enabled
        var selected: ButtonView?
        var othersCount = 0
        
        for button in buttons {
            guard let buttonViewModel = button.viewModel else {
                continue
            }
            
            if buttonViewModel == model {
                selected = button
            } else {
                if buttonViewModel.isSelected {
                    othersCount += 1
                }
            }
        }
        
        guard var buttonViewModel = selected?.viewModel else {
            return
        }
        
        // if user wants to unselect it
        if buttonViewModel.isSelected {
            // check if it's the only one selected, if so, don't unselect it
            if othersCount > 0 {
                buttonViewModel.isSelected = false
            }
        } else {
            // if user wants to select it, then just do it
            buttonViewModel.isSelected = true
        }
        
        // set the viewModel to trigger the redraw action
        selected?.viewModel = buttonViewModel
    }
    
    func markAsSelected(_ model: ButtonViewModel) {
        buttons.forEach { (button) in
            guard var buttonViewModel = button.viewModel else {
                return
            }
            
            buttonViewModel.isSelected = buttonViewModel == model
            button.viewModel = buttonViewModel
        }
    }
}
