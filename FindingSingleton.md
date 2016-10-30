
Finding Singletons as many as you can!

ex)

- class name: description. (finder's name)

results)
- UIScreen: UIScreen has a mainScreen **singleton**, which refers to the screen on your iPhone, iPad, whatever. 
  There can only ever be one main screen on these devices. (Yagom)

- UIApplication: The UIApplication class provides a centralized point of control and coordination for apps running in iOS. 
Every app has exactly one instance of UIApplication (or, very rarely, a subclass of UIApplication). 
When an app is launched, the system calls the UIApplicationMain function; 
among its other tasks, this function creates a **Singleton** UIApplication object. 
Thereafter you access the object by calling the sharedApplication class method. (Jihun) - 1 checked

- NSFileManager, NSWorkspace, ~~UIApplication~~, UIAccelerometer, sharedFileManager, sharedColorPanel, sharedWorkspace: 
Several Cocoa framework classes are **singletons**. They include **NSFileManager**, **NSWorkspace**, and, in UIKit, **UIApplication** and **UIAccelerometer**. The name of the factory method returning the singleton instance has, by convention, the form sharedClassType. Examples from the Cocoa frameworks are **sharedFileManager**, **sharedColorPanel**, and **sharedWorkspace**. (Self.name) - 6 checked

- 서로 다른 클래스 객체간의 통신을 관리하는 객체
  [NSNotificationCenter defaultCenter]; (이홍화) - 1 checked
