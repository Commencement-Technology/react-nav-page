#import "RNReactNavPageSpec.h"
#import "ReactNavPage.h"
#import "react_nav_page-Swift.h"

/**
 * Declare the ObjC implementation for that native module class
 */

@interface ReactNavPage () <NativeReactNavPageSpec>
@end


@interface ReactNavPage () <ReactNavPageImplDelegate>
@end



@implementation ReactNavPage {
    //ReactNavPageImpl *moduleImpl;
    BOOL hasListeners;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        //moduleImpl = [ReactNavPageImpl new];
        ReactNavPageImpl.sharedInstance.delegate = self;
        //moduleImpl.delegate = self;
    }
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

RCT_EXPORT_MODULE(ReactNavPage)

- (void)pop { 
    [ReactNavPageImpl.sharedInstance pop];
}



- (void)push:(NSString *)routeName params:(NSDictionary *)params { 
    [ReactNavPageImpl.sharedInstance pushWithRouteName:routeName params:params];
}

- (void)setRoot:(NSString *)type routeName:(NSString *)routeName initialProps:(NSDictionary *)initialProps stacks:(NSDictionary *)stacks tabBar:(NSDictionary *)tabBar {
    NSArray *valArray = [NSArray arrayWithObjects: stacks, nil];
    [ReactNavPageImpl.sharedInstance setRootWithRouteName:routeName type:type initialProps:initialProps stacks:valArray[0] tabBar:tabBar];
}

- (void)changeTab:(double)index { 
    [ReactNavPageImpl.sharedInstance changeTabWithIndex:index];
}





- (void)startObserving
{
    hasListeners = YES;
}

- (void)stopObserving
{
    hasListeners = NO;
}

- (NSArray<NSString *> *)supportedEvents{
    return @[@"onRouteChange", @"onTabChange"];
}


- (void)sendNavigationEventWithName:(NSString * _Nonnull)name payload:(NSDictionary<NSString *,id> * _Nonnull)payload {
    if (hasListeners) {
      [self sendEventWithName:name body:payload];
    }
}

- (void)sendTabChangeEventWithName:(NSString * _Nonnull)name payload:(NSDictionary<NSString *,id> * _Nonnull)payload {
    if (hasListeners) {
      [self sendEventWithName:name body:payload];
    }
}



- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params{
    return std::make_shared<facebook::react::NativeReactNavPageSpecJSI>(params);
}


@end
