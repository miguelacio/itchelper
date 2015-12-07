//
//  StudentsTableViewController.h
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 30/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentsTableViewController : UITableViewController <NSURLConnectionDataDelegate>
    {

        NSURLConnection *conexion;
        NSMutableData   *datosWeb;
        NSMutableArray  *StudentArray;
        
    
    }



@end
