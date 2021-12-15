//
//  MainScreenView.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation
import UIKit
import SnapKit

protocol MainScreenViewControllerProtocol {
    var presenter: MainScreenPresenterProtocol? { get set }
    
    func updateUserData(data: RandomUser)
    func updateUserImage(photo: UIImage)
}

class MainScreenViewController: UIViewController, MainScreenViewControllerProtocol {
    
    var presenter: MainScreenPresenterProtocol?
    
    private var image = UIImageView()
    private var nameLabel = UILabel()
    private var locationLabel = UILabel()
    private var emailLabel = UILabel()
    private var phoneLabel = UILabel()
    private var cellLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        getRandomUser()
        setSubviews()
    }
    
    func updateUserData(data: RandomUser) {
        nameLabel.text = "Name: \(data.name.first) \(data.name.title) \(data.name.last) (\(data.gender))"
        locationLabel.text = "Loc: \(data.location.city), \(data.location.country), \(data.location.postcode)"
        emailLabel.text = "Email: \(data.email)"
        phoneLabel.text = "Phone: \(data.phone)"
        cellLabel.text = "Cell: \(data.cell)"
        presenter?.getImage(url: data.picture.medium)
    }
    
    func updateUserImage(photo: UIImage) {
        image.image = photo
    }
    
    private func getRandomUser() {
        presenter?.getRandomUserData()
    }
    
    private func setSubviews() {
        setImage()
        setNameLabel()
        setLocationLabel()
        setEmailLabel()
        setPhoneLabel()
        setCellLabel()
    }
    
    private func setImage() {
        image.backgroundColor = .lightGray
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        view.addSubview(image)
        image.image = UIImage(named: "loadingImage")
        imageConstraints()
    }
    
    private func setNameLabel() {
        nameLabel.backgroundColor = .white
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 7
        nameLabel.clipsToBounds = true
        nameLabel.textAlignment = .left
        view.addSubview(nameLabel)
        nameLabelConstraints()
    }
    
    private func setLocationLabel() {
        locationLabel.backgroundColor = .white
        locationLabel.layer.masksToBounds = true
        locationLabel.layer.cornerRadius = 7
        locationLabel.clipsToBounds = true
        locationLabel.textAlignment = .left
        view.addSubview(locationLabel)
        locationLabelConstraints()
    }
    
    private func setEmailLabel() {
        emailLabel.backgroundColor = .white
        emailLabel.layer.masksToBounds = true
        emailLabel.layer.cornerRadius = 7
        emailLabel.clipsToBounds = true
        emailLabel.textAlignment = .left
        view.addSubview(emailLabel)
        emailLabelConstraints()
    }
    
    private func setPhoneLabel() {
        phoneLabel.backgroundColor = .white
        phoneLabel.layer.masksToBounds = true
        phoneLabel.layer.cornerRadius = 7
        phoneLabel.clipsToBounds = true
        phoneLabel.textAlignment = .left
        view.addSubview(phoneLabel)
        phoneLabelConstraints()
    }
    
    private func setCellLabel() {
        cellLabel.backgroundColor = .white
        cellLabel.layer.masksToBounds = true
        cellLabel.layer.cornerRadius = 7
        cellLabel.clipsToBounds = true
        cellLabel.textAlignment = .left
        view.addSubview(cellLabel)
        cellLabelConstraints()
    }
    
    private func imageConstraints() {
        image.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(view.frame.height / 9)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(150)
        }
    }
    
    private func nameLabelConstraints() {
        nameLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
            maker.top.equalTo(image).inset(170)
            maker.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func locationLabelConstraints() {
        locationLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
            maker.top.equalTo(nameLabel).inset(50)
            maker.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func emailLabelConstraints() {
        emailLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
            maker.top.equalTo(locationLabel).inset(50)
            maker.left.right.equalToSuperview().inset(20)
        }
    }

    private func phoneLabelConstraints() {
        phoneLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
            maker.top.equalTo(emailLabel).inset(50)
            maker.left.right.equalToSuperview().inset(20)
        }
    }

    private func cellLabelConstraints() {
        cellLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
            maker.top.equalTo(phoneLabel).inset(50)
            maker.left.right.equalToSuperview().inset(20)
        }
    }
}
