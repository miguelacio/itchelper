//
//  ViewController.h
//  Teachers Helper for ITC
//
//  Created by CCDM16 on 20/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UITextField *textUser, *textPassword;
    UIActivityIndicatorView *indicador;
    UIButton *signIn;
    NSMutableData *datosWeb;
    NSURLConnection *conexion;
}
@property(nonatomic,strong)IBOutlet UITextField *textUser;
@property(nonatomic,strong)IBOutlet UITextField *textPassword;
@property(nonatomic,strong)IBOutlet UIActivityIndicatorView *indicador;

-(IBAction)btnSignIn:(id)sender;
@end

