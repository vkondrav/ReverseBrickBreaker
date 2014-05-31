//
//  Released by YoYo Games Ltd. on 17/04/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//


package ${YYAndroidPackageName};

import android.util.Log;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.InterstitialAd;
import android.os.Build;
import ${YYAndroidPackageName}.R;
import android.app.Activity;
import android.view.ViewGroup;
import android.view.View;
import android.widget.AbsoluteLayout;

public class GoogleMobileAdsExt extends AdListener
{
	private AdView adView=null;
	private InterstitialAd interstitialAd=null;
	private String BannerId;
	private String InterstitialId;
	private String InterstitialStatus = "Not loaded";
	
	
	public void GoogleMobileAds_Init(String _Arg1,String _Arg2)
	{
	
		BannerId = _Arg1;
		InterstitialId = _Arg2;	
	}
	
	
	public void GoogleMobileAds_ShowInterstitial()
	{
		if(interstitialAd!=null)
		{
	
	RunnerActivity.ViewHandler.post( new Runnable() {
    			public void run() {
	
		Log.i("yoyo","showinterstitial called");
		if (interstitialAd.isLoaded()) 
		{
			interstitialAd.show();
		} 
		else
		{
			Log.i("yoyo", "Interstitial ad was not ready to be shown.");
		}
		}});
		}
	}
	
	public void GoogleMobileAds_InitInterstitial()
	{
	
		interstitialAd = new InterstitialAd(RunnerActivity.CurrentActivity);
		interstitialAd.setAdUnitId(InterstitialId);
			
		interstitialAd.setAdListener(GoogleMobileAdsExt.this);
	}
	
	public void GoogleMobileAds_LoadInterstitial()
	{
		RunnerActivity.ViewHandler.post( new Runnable() {
    			public void run() {
				
				if(interstitialAd==null)
					GoogleMobileAds_InitInterstitial();
				
	  AdRequest adRequest = new AdRequest.Builder()
        .addTestDevice(AdRequest.DEVICE_ID_EMULATOR)
     //   .addTestDevice("INSERT_YOUR_HASHED_DEVICE_ID_HERE")
        .build();

    // Load the interstitial ad.
    interstitialAd.loadAd(adRequest);
		}});
	}
	
	public void GoogleMobileAds_AddBanner()
	{
		if(adView!=null)
			return;
	
		final String Arg1 = BannerId;
		
		RunnerActivity.ViewHandler.post( new Runnable() {
    			public void run() {
	
		adView = new AdView(RunnerActivity.CurrentActivity);
		
		int sdkVersion =Build.VERSION.SDK_INT;
		if (sdkVersion > 10)
			adView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
		
		adView.setAdSize(AdSize.BANNER);	
		adView.setAdUnitId(Arg1);
		

		
		AbsoluteLayout layout = (AbsoluteLayout)RunnerActivity.CurrentActivity.findViewById(R.id.ad);
		ViewGroup vg = (ViewGroup)layout;
		if(layout!=null)
		{
			
			vg.addView((View)adView);
			
			  AdRequest adRequest = new AdRequest.Builder()
			.addTestDevice(AdRequest.DEVICE_ID_EMULATOR)
			//.addTestDevice("A91BB9565EAC58AB65FFB73C864BB60E")
			.build();
			
		
			// Start loading the ad in the background.
			
			
		
			adView.requestLayout();
			adView.setVisibility(View.VISIBLE);
			adView.loadAd(adRequest);
		}
		
		}
		});
	}
	
	
	public String GoogleMobileAds_InterstitialStatus()
	{
		if(interstitialAd!=null)
		{
			RunnerActivity.ViewHandler.post( new Runnable() {
    			public void run() {
	
			if(interstitialAd.isLoaded()) //Seems to not want to work...
				InterstitialStatus="Ready";
			else
				InterstitialStatus = "Not Loaded";
				}});
		}
	
	
	
		return InterstitialStatus;
			
	}
	
		@Override
      public void onAdLoaded() {
		Log.i("yoyo","onAdLoaded called");
      }

      @Override
      public void onAdFailedToLoad(int errorCode) {
		Log.i("yoyo","onAdFailedToLoad called");
     
      }

	
/*	 @Override
  public void onResume() {
    super.onResume();
    if (adView != null) {
      adView.resume();
    }
  }

  @Override
  public void onPause() {
    if (adView != null) {
      adView.pause();
    }
    super.onPause();
  }
*/
  /** Called before the activity is destroyed. */
  /*
  @Override
  public void onDestroy() {
    // Destroy the AdView.
    if (adView != null) {
      adView.destroy();
    }
    super.onDestroy();
  }	
	*/
}



