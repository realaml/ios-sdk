# ``Realaml``

Realaml SDK supports iOS 11 and above


## Install iOS framework from Cocoapods
```
pod 'Realaml'
```


## Required Permissions
```
Privacy - Camera Usage Description
```


## Getting Started

### UIKit (Swift)

Start KYC session
```Swift
import Realaml

class ViewController: UIViewController {

    @IBAction private func startKYC(_ sender: Any) {

        let controller: KYCViewController = KYCViewController(environment: .staging, 
                                                              signatureKey: YOUR_SIGNATURE_KEY)
        controller.delegate = self
        self.present(controller, animated: true)
    }
}
```


Implement delegate functions to listen callbacks
```Swift
extension ViewController: KYCViewControllerDelegate {
    func kycViewController(_ controller: KYCViewController, didFinishWith error: Error?) {
        kycController.dismiss(animated: true)
    }

    func kycViewControllerDidCancelled(_ controller: KYCViewController) {
        kycController.dismiss(animated: true)
    }
}
```


### SwiftUI

Start KYC session
```Swift
import Realaml

struct ContentView: View {

    @State private var isKycPresented = false

    @State private var kycResult: KYCView.Result?

    private let signKey = "YOUR_SIGNATURE_KEY"

    var body: some View {
        //...
        .fullScreenCover(isPresented: $isKycPresented) {
            KYCView(environment: .staging, signatureKey: signKey, result: $kycResult)
        }
    }
}
```


### UIKit (Objective-C)

Start KYC session and implement delegate functions to listen callbacks
```objc
#import <Realaml/Realaml.h>

@interface ViewController ()<KYCViewControllerDelegate>

@end

@implementation ViewController

- (IBAction)startKYC:(id)sender {

    KYCViewController *controller = [[KYCViewController alloc] initWithEnvironment:RealamlEnvironmentStaging 
                                                                      signatureKey:YOUR_SIGNATURE_KEY];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)kycViewController:(KYCViewController *)controller didFinishWith:(nullable NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)kycViewControllerDidCancelled:(KYCViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
```

## Environment

```Swift
public enum RealamlEnvironment: Int {
    case staging
    case release
}
```

## Error Codes

```Swift
public enum RealamlErrorCode: Int {
    case invalidSignatureKey
    case networkError
    case cameraPermissionDenied
}
```
