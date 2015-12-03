//
//  GroupsTableViewController.h
//  Teachers Helper for ITC
//
//  Created by CCDM16 on 25/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FatherClass.h"

@interface GroupsTableViewController : UITableViewController <NSURLConnectionDataDelegate>
{
    NSURLConnection *conexion;
    NSMutableData   *datosWeb;
    NSMutableArray  *groupArray;
    
    NSString *variableGlobal;
    NSString *claveMateria;
    NSString *nombreLargo;
    NSString *claveGrupo;
    NSString *lunes;
    NSString *martes;
    NSString *miercoles;
    NSString *jueves;
    NSString *viernes;
    NSString *sabado;
}

@property(strong,nonatomic) NSString *varibaleGlobal;
@property(strong,nonatomic) NSString *claveMateria;
@property(strong,nonatomic) NSString *nombreLargo;
@property(strong,nonatomic) NSString *claveGrupo;
@property(strong,nonatomic) NSString *lunes;
@property(strong,nonatomic) NSString *martes;
@property(strong,nonatomic) NSString *miercoles;
@property(strong,nonatomic) NSString *jueves;
@property(strong,nonatomic) NSString *viernes;
@property(strong,nonatomic) NSString *sabado;
@end
