//
//  FollowingViewController.h
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 10/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowingViewController : UIViewController
{
    NSURLConnection *conexion;
    NSMutableData   *datosWeb;
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblFechaPlaneadaInstructor;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaSeg1;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaSeg2;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaSeg3;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaReporteFinal;

@end
