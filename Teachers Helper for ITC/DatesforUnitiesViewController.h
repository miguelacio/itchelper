//
//  DatesforUnitiesViewController.h
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 10/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatesforUnitiesViewController : UIViewController <UITableViewDelegate>
{
    NSURLConnection *conexion;
    NSMutableData   *datosWeb;
    NSMutableArray  *unitArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableViewUnidades;
@property (weak, nonatomic) IBOutlet UILabel *lblrealprogramada;
@property (weak, nonatomic) IBOutlet UILabel *lblInicialReal;
@property (weak, nonatomic) IBOutlet UILabel *lblFinalProgramada;
@property (weak, nonatomic) IBOutlet UILabel *lblFinalReal;

@end
