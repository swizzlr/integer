#integer

> Lat. lit. *untouched*, usu. *whole*

A CocoaPods plugin to verify that pod sources have not been modified.

##Why?

Many choose not to check in their Pods/ folder. This is fine, but increases exposure to the "hit by a bus" scenario. Furthermore, it adds complexity to CI servers and slows the developer's ability to quickly checkout feature branches with different dependencies.

##How?

This plugin aims to solve the major roadblock to checking in Pods folders by checksumming files as they are downloaded and storing the results in the Podfile.lock. Through a yet to be determined method (I intend to add it as a target build phase after `Check Pods/Manifest.lock`) the Pods folder will have the check run against the Podfile.lock.

Since this plugin aims to support a source controlled Pods workflow, it will also attempt to invoke a git commit after a successful pod install which has caused a change, in order to atomically preserve changes and separate dependency updates from first party code.
