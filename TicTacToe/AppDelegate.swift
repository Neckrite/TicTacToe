import UIKit // Импортирует UIKit, фреймворк для разработки пользовательского интерфейса для iOS.

@main // Определяет точку входа в приложение. Этот атрибут указывает, что класс AppDelegate является основным классом приложения.
class AppDelegate: UIResponder, UIApplicationDelegate { // Объявляет класс AppDelegate, который наследуется от UIResponder и реализует протокол UIApplicationDelegate.

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { // Этот метод вызывается после того, как приложение завершило запуск. Здесь обычно выполняются настройки приложения.

        return true // Возвращает true, указывая, что приложение успешно запущено.
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration { // Этот метод вызывается, когда новая сессия сцены создается в приложении.

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role) // Возвращает конфигурацию сцены с именем "Default Configuration" и ролью сессии, которая была передана в метод.
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { // Этот метод вызывается, когда сессия сцены была отброшена.

        // Здесь можно выполнить любую необходимую очистку.
    }
}
