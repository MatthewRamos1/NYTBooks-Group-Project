//
//  EmptyView.swift
//  NYTBooks-Group-Project
//
//  Created by Eric Davenport on 2/12/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class EmptyView: UIView {

  public lazy var headerLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.font = label.font.withSize(25)
    label.text = "Title Label"
    label.textAlignment = .center
    return label
  }()
  
  public lazy var subheaderLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .subheadline)
    label.font = label.font.withSize(20)
    label.text = "Subhead label"
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()

  init(title: String, message: String) {
    super.init(frame: UIScreen.main.bounds)
    headerLabel.text = title
    subheaderLabel.text = message
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    headLabelConstraints()
    subheaderLabelConstraints()
  }

  private func headLabelConstraints() {
    addSubview(headerLabel)
    headerLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
    headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
    headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }
  
  private func subheaderLabelConstraints() {
    addSubview(subheaderLabel)
    subheaderLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    subheaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
    subheaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
    subheaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }

}
