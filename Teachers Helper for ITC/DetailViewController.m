//
//  DetailViewController.m
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 27/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "DetailViewController.h"
#import "StudentsTableViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize details,lbl,claveMateria, claveGrupo, lunes, martes, miercoles, jueves, viernes, sabado, nombreLargo, lblClaveGrupo, lblClaveMateria, lblJueves, lblLunes, lblMartes, lblMiercoles, lblNombreLargo, lblSabado, lblViernes;

- (void)viewDidLoad {
     self.navigationItem.title = @"Test";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    lbl.text = details;
    lblLunes.text = lunes;
    lblMartes.text = martes;
    lblClaveGrupo.text = claveGrupo;
    lblClaveMateria.text=claveMateria;
    lblMiercoles.text = miercoles;
    lblNombreLargo.text = nombreLargo;
    lblJueves.text = jueves;
    lblViernes.text = viernes;
    
    
    [[NSUserDefaults standardUserDefaults] setObject:claveGrupo forKey:@"currentClaveGrupo"];
    [[NSUserDefaults standardUserDefaults] setObject:claveMateria forKey:@"currentClaveMateria"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(claveGrupo);
    NSLog(claveMateria);
 

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
