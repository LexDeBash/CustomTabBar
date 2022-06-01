//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Vasichko Anna on 01.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        
    }
    
    private func generateTabBar() {
        let homeViewController = HomeViewController()
        let personViewController = PersonViewController()
        let settingsViewController = SettingsViewController()
        
        let homeImage = UIImage(systemName: "house.fill")!
        let personImage = UIImage(systemName: "person.fill")!
        let settingsImage = UIImage(systemName: "slider.horizontal.3")!
        
       
        viewControllers = [
            generateVC(viewController: homeViewController, title: "Home", image: homeImage),
            generateVC(viewController: personViewController, title: "Personal Info", image: personImage),
            generateVC(viewController: settingsViewController, title: "Settings", image: settingsImage)
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let viewController = viewController
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.tintColor = .tabBarItemMain()
        tabBar.barTintColor = .clear
        tabBar.backgroundColor = .clear
        
        let roundLayer = CAShapeLayer()
        
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        roundLayer.fillColor = UIColor.mainWhite().cgColor
  
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.unselectedItemTintColor = .tabBarItemLight()
    }

}

