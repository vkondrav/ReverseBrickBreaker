//
//  Released by YoYo Games Ltd. on 17/04/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//


#import "admob.h"
#import "GADBannerView.h"
#import "GADAdSize.h"
#import "GADInterstitial.h"



const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern UIViewController *g_controller;
extern UIView *g_glView;

NSString *g_AdId;
NSString *g_IntAdId;
BOOL g_InterstitialReady=false;
@implementation GoogleMobileAdsExt




- (void) GoogleMobileAds_Init:(char *)IntID IntId:(char*)int_id
{
	
	g_IntAdId  = [NSString stringWithCString:int_id encoding:NSUTF8StringEncoding];
	
	g_AdId = [NSString stringWithCString:IntID encoding:NSUTF8StringEncoding];
	
	[g_IntAdId retain];
	[g_AdId retain];
	
	g_InterstitialReady = false;
	
}

-(void)GoogleMobileAds_AddBanner
{
	bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
	bannerView.adUnitID = g_AdId;
	bannerView.rootViewController = g_controller;
	[g_glView addSubview:bannerView];
	
	GADRequest *request = [GADRequest request];
	//request.testDevices = @[ @"a4dc6ddd7107dd26da54c7cc7033b399" ];
	[bannerView loadRequest:request];
	

}

-(void)GoogleMobileAds_LoadInterstitial
{
	GADRequest *request = [GADRequest request];
//	request.testDevices = @[ @"a4dc6ddd7107dd26da54c7cc7033b399" ];	
	interstitial = [[GADInterstitial alloc] init];
	interstitial.adUnitID = g_IntAdId;
	interstitial.delegate = self;
	[interstitial loadRequest:request];
	g_InterstitialReady = false;
}

-(NSString *)GoogleMobileAds_InterstitialStatus
{
	if(g_InterstitialReady)
		return @"Ready";
	else
		return @"Not Ready";
}

-(void)GoogleMobileAds_ShowInterstitial
{
	[interstitial presentFromRootViewController:g_controller];
	g_InterstitialReady = false;
}

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad
{
	NSLog(@"Ad received");
	g_InterstitialReady = true;
}
- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error
{
	NSLog(@"Ad failed to receive: %@",error);
}


- (void)interstitialWillPresentScreen:(GADInterstitial *)ad
{
	NSLog(@"Interstitial will present screen");
}

// Sent before the interstitial is to be animated off the screen.
- (void)interstitialWillDismissScreen:(GADInterstitial *)ad
{
	NSLog(@"Interstitial will dismiss screen");
}

// Sent just after dismissing an interstitial and it has animated off the
// screen.
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad
{
	NSLog(@"Interstitial did dismiss screen");
}

// Sent just before the application will background or terminate because the
// user clicked on an ad that will launch another application (such as the App
// Store).  The normal UIApplicationDelegate methods, like
// applicationDidEnterBackground:, will be called immediately before this.
- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad
{
	NSLog(@"Interstitial will leave app");
}

@end

