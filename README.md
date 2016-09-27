# VadioPartnerTest-iOS

This is intended to allow you to share tests of your use cases with us. After getting your fork set up, please let us know you would like it included in our test suite.


## Getting started

After forking the repo, you will need to add the version of the VadioSDK you'd like to test with. Add a folder at the same level as the repository named `_deps` and drop the whole `VadioSDK` folder into it.

Create a plist called credentials.plist and put it into the `_deps` folder as well. It should contain only one key pair using the key `vadio_api_key`, and value should be your api key.

Directory structure:
```
- _deps
	- credentials.plist
	- VadioSDK
		...
- VadioPartnerTest-iOS
	...
```

Change the handle in the `- (void)viewDidLoad` method in `ViewController.m` to a handle that you would like to test with.

A very basic implementation of our sdk is included in the app, so if you run it without changing anything else, you should see some video. If using any third party testing frameworks, please keep them in the `_deps` folder.
