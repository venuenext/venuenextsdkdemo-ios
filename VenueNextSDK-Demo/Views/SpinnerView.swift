// Copyright © 2019 VenueNext. All rights reserved.

import UIKit

public class SpinnerView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        spinner.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
