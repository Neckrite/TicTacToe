import UIKit // Импортирует UIKit, фреймворк для разработки пользовательского интерфейса для iOS.

class SceneDelegate: UIResponder, UIWindowSceneDelegate { // Объявляет класс SceneDelegate, который наследуется от UIResponder и реализует протокол UIWindowSceneDelegate.

    var window: UIWindow? // Определяет переменную window типа UIWindow?, которая представляет окно приложения.

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) { // Этот метод вызывается, когда новая сессия сцены будет подключена к приложению.
        guard let _ = (scene as? UIWindowScene) else { return } // Проверяет, является ли сцена экземпляром UIWindowScene. Если нет, то возвращает из функции.
    }

    func sceneDidDisconnect(_ scene: UIScene) { // Этот метод вызывается, когда сцена была отключена от приложения.
        // Здесь можно выполнить любую необходимую очистку.
    }

    func sceneDidBecomeActive(_ scene: UIScene) { // Этот метод вызывается, когда сцена становится активной.
        // Здесь можно выполнить действия, которые требуются при активации сцены.
    }

    func sceneWillResignActive(_ scene: UIScene) { // Этот метод вызывается, когда сцена перестает быть активной.
        // Здесь можно выполнить действия, которые требуются при деактивации сцены.
    }

    func sceneWillEnterForeground(_ scene: UIScene) { // Этот метод вызывается, когда сцена переходит из фона в передний план.
        // Здесь можно выполнить действия, которые требуются при переходе сцены в передний план.
    }

    func sceneDidEnterBackground(_ scene: UIScene) { // Этот метод вызывается, когда сцена переходит в фоновый режим.
        // Здесь можно выполнить действия, которые требуются при переходе сцены в фоновый режим.
    }
}
