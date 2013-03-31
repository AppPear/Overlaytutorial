Overlaytutorial
===============
Hi!
This little code is created to help add and manage overlays (image) in your app, especially tutorials.

Import the Overlaytutorial.h file or prefix it, then you can add the overlay with this simple method:
[TutorialOverlay addOverlayInView:<#(UIView *)#> withImageNamed:<#(NSString *)#> withAnimation:<#(BOOL)#> withUserInteraction:<#(BOOL)#>];

If userinteraction is YES you must remove the overlay(s) (you can overlay an overlay :) ) with this method:
[TutorialOverlay removeOverlaysInView:<#(UIView *)#>]; if not, one simple tap on the overlay will remove that.

You can add a notification, it will fire when the overlay removed:
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(<#selector#>) name:OverlayNotificationKey object:nil];
