//
//  Released by YoYo Games Ltd. on 17/04/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//


#import "GADBannerView.h"
#import "GADInterstitial.h"

@interface GoogleMobileAdsExt:NSObject<GADInterstitialDelegate>
{
	GADBannerView *bannerView;
	GADInterstitial *interstitial;
}
- (void) GoogleMobileAds_Init:(char*)IntID IntId:(char*)int_id;
-(void)GoogleMobileAds_ShowInterstitial;
-(void)GoogleMobileAds_LoadInterstitial;
-(NSString *)GoogleMobileAds_InterstitialStatus;
-(void)GoogleMobileAds_AddBanner;


@end
