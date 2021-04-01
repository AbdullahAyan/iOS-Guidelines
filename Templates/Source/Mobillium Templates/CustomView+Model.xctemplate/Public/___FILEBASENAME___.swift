//___FILEHEADER___

import UIKit

public class ___VARIABLE_moduleName___: UIView {

    weak var viewModel: ___VARIABLE_moduleName___Protocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }

    private func configureContents() {

    }

    public func set(viewModel: ___VARIABLE_moduleName___Protocol) {
        self.viewModel = viewModel

    }

}
