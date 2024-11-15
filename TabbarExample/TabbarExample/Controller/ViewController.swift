import UIKit

class ViewController: UITabBarController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTabbar()
    }

    func setTabbar() {

        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        self.viewControllers = [vc1, vc2, vc3]
        self.tabBar.tintColor = .gray
        self.tabBar.barTintColor = .white
        
        guard let tabBarItem = self.tabBar.items else { return }
        tabBarItem[0].image = UIImage(systemName: "house")
        tabBarItem[1].image = UIImage(systemName: "folder.fill")
        tabBarItem[2].image = UIImage(systemName: "person.crop.badge.magnifyingglass")
        tabBarItem[0].title = "Home"
        tabBarItem[1].title = "Folder"
        tabBarItem[2].title = "Search"
        
        
    }
}

