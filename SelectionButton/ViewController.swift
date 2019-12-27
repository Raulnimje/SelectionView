import UIKit
import PureLayout

class ViewController: UIViewController {

    @IBOutlet private var toggle: UISwitch!
    
    private let selectionView = SelectionView(forAutoLayout: ())
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
        
        setupToggle()
        addStack()
    }
}

private extension ViewController {
    func addStack() {
        view.addSubview(selectionView)
        
        selectionView.autoPinEdge(.top, to: .bottom, of: toggle, withOffset: 40)
        selectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        selectionView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        selectionView.autoSetDimension(.height, toSize: 75)
        
        selectionView.viewModel = viewModel.selectionViewModel(multiple: true)
    }
    
    func setupToggle() {
        toggle.isOn = true
        toggle.onTintColor = viewModel.selectionColor
    }
    
    @IBAction func toggleChanged(_ sender: UISwitch) {
        selectionView.viewModel = viewModel.selectionViewModel(multiple: sender.isOn)
    }
}
