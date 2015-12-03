//
//  DetailViewController.h
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 27/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

{
    __weak IBOutlet UILabel *lbl;
    __weak IBOutlet UILabel *lblClaveMateria;
    __weak IBOutlet UILabel *lblNombreLargo;
    __weak IBOutlet UILabel *lblClaveGrupo;
    __weak IBOutlet UILabel *lblLunes;
    __weak IBOutlet UILabel *lblMartes;
    __weak IBOutlet UILabel *lblMiercoles;
    __weak IBOutlet UILabel *lblJueves;
    __weak IBOutlet UILabel *lblViernes;
    __weak IBOutlet UILabel *lblSabado;
    
}
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet UILabel *lblClaveMateria;
@property (weak, nonatomic) IBOutlet UILabel *lblNombreLargo;
@property (weak, nonatomic) IBOutlet UILabel *lblClaveGrupo;
@property (weak, nonatomic) IBOutlet UILabel *lblLunes;
@property (weak, nonatomic) IBOutlet UILabel *lblMartes;
@property (weak, nonatomic) IBOutlet UILabel *lblMiercoles;
@property (weak, nonatomic) IBOutlet UILabel *lblJueves;
@property (weak, nonatomic) IBOutlet UILabel *lblViernes;
@property (weak, nonatomic) IBOutlet UILabel *lblSabado;


@property(strong,nonatomic) NSString *details;
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
