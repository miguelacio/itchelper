//
//  ProgramedAndRealDatesByGroupTableViewController.h
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 10/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramedAndRealDatesByGroupTableViewController : UITableViewController
{
    NSURLConnection *conexion;
    NSMutableData   *datosWeb;
    NSMutableArray  *examsArray;
    
    //Examenes
    NSString *real01;
    NSString *real02;
    NSString *real03;
    NSString *real04;
    NSString *real05;
    NSString *real06;
    NSString *real07;
    NSString *real08;
    NSString *real09;
    NSString *real10;
    NSString *real11;
    NSString *real12;
    NSString *real13;
    NSString *real14;
    NSString *real15;
    
    NSString *programmed01;
    NSString *programmed02;
    NSString *programmed03;
    NSString *programmed04;
    NSString *programmed05;
    NSString *programmed06;
    NSString *programmed07;
    NSString *programmed08;
    NSString *programmed09;
    NSString *programmed10;
    NSString *programmed11;
    NSString *programmed12;
    NSString *programmed13;
    NSString *programmed14;
    NSString *programmed15;
}
@end
