//
//  ViewController.swift
//  total bill
//
//  Created by Михаил Переверзин on 25.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = "Enter the invoice amount and click \"Calculate\""
        description.textColor = .black
        description.font = UIFont(name: "Avenir Next Bold", size: 15)
        description.translatesAutoresizingMaskIntoConstraints = false
        //Разрешение уменьшать размер шрифта на разных экранах
        description.adjustsFontSizeToFitWidth = true
        // Минимальный размер шрифта на который можно уменьшить текст
        description.minimumScaleFactor = 0.7
        description.textAlignment = .center
        description.numberOfLines = 2
        return description
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        //button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20 )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personView = PersonView()
    let tipsView = TipsView()
    
    override func viewDidLoad() { //Метод с которого начинается загрузка
        super.viewDidLoad()
       
        setupVievs()
        setConstrains()
        tapped()
    }

    func setupVievs() { //Настройка объектов (все вью,лейблы и тд)
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)

        
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personView)
        view.addSubview(tipsView)
        view.addSubview(calculateButton)
        calculateButton.titleLabel?.font = UIFont(name: "Avenir Next", size: view.frame.height / 44 )

    }
    //Логика рассчета
    @objc func calculateButtonTapped() {
         guard let totalBill = totalBillView.sumTextField.text,
               let totalBillInt = Int(totalBill) else {return}
         
         let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
         let persons = personView.counter
        
         if persons == 0 {
            descriptionLabel.text = "Enter persons count"
            descriptionLabel.textColor = .red
         } else {
            let result = summ / persons
            descriptionLabel.text = "\(result) per person"
            descriptionLabel.textColor = .black
        }
    }
    // Метод исчезновения клавиатуры
    func tapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
 
//Расширение Вьюшки
extension MainViewController {
    
    func setConstrains() {
        NSLayoutConstraint.activate([ // Расположение объектов
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10 ),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            personView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            tipsView.topAnchor.constraint(equalTo: personView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),

            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 15),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
    
}
