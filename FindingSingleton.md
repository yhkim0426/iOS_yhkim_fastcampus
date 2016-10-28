
Finding Singletons as many as you can!

ex)

- class name: description. (finder's name)

results)
- UIScreen: UIScreen has a mainScreen **singleton**, which refers to the screen on your iPhone, iPad, whatever. 
  There can only ever be one main screen on these devices. (Yagom)

- UIApplication : The UIApplication class provides a centralized point of control and coordination for apps running in iOS. 
Every app has exactly one instance of UIApplication (or, very rarely, a subclass of UIApplication). 
When an app is launched, the system calls the UIApplicationMain function; 
among its other tasks, this function creates a Singleton UIApplication object. 
Thereafter you access the object by calling the sharedApplication class method. (Jihun2)
