//
//  FollowingViewController.m
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 10/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "FollowingViewController.h"

@interface FollowingViewController ()


@end


@implementation FollowingViewController

@synthesize lblFechaPlaneadaInstructor, lblFechaSeg1, lblFechaSeg2, lblFechaSeg3, lblFechaReporteFinal;

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [datosWeb setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [datosWeb appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error en la conexión");
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSArray *jsonRecibido = [NSJSONSerialization JSONObjectWithData:datosWeb options:kNilOptions error:NULL];
    
    
    
    
    for(NSDictionary *elemento in jsonRecibido)
    {
        [lblFechaPlaneadaInstructor setText:elemento[@"fecplaneainstru"]];
        [lblFechaSeg1 setText:elemento[@"seguimiento01"]];
        [lblFechaSeg2 setText:elemento[@"seguimiento02"]];
        [lblFechaSeg3 setText:elemento[@"seguimiento03"]];
        [lblFechaReporteFinal setText:elemento[@"reportefinal"]];


        
    }
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"entro al view did load");
    NSString *user = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    NSString *password = [[NSUserDefaults standardUserDefaults] valueForKey:@"userPassword"];

    NSString *calificaURL=@"http://intertec.itculiacan.edu.mx/intertecmovil/seguimientos.php?cadena=920-12345678";
    
    
    
   // calificaURL =[[[[[[[calificaURL stringByAppendingString:user]stringByAppendingString:@"-"]stringByAppendingString:password]stringByAppendingString:@"-"]stringByAppendingString:claveGrupo]stringByAppendingString:@"-"]stringByAppendingString:claveMateria];
    
    
    calificaURL = [calificaURL stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSURL *finalCalificaURL = [NSURL URLWithString:calificaURL];
    NSMutableURLRequest *solicitud = [NSMutableURLRequest requestWithURL:finalCalificaURL];
    
    //Establecemeos conexion
    conexion = [[NSURLConnection alloc]initWithRequest:solicitud delegate:self];
    
    
    //Verificar conexion
    if(conexion) //si la conexion fue exitosa.
    {
        NSLog(@"Conexión establecida en seguimiento");
        datosWeb = [NSMutableData data]; //Inicializa datosWeb.
        
    }

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
