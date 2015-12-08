//
//  ScoresViewController.m
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 08/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "ScoresViewController.h"
#import "FatherClass.h"

@interface ScoresViewController ()

@end

@implementation ScoresViewController

@synthesize lblClaveGrupo, lblClaveMateria, lblNombreCompleto, lblNumControl, lblParcial1, lblParcial2, lblParcial3, lblParcial4, lblParcial5, lblParcial6, lblParcial7, lblParcial8;

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
    
    NSString *numControl = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentNumControl"];
   
    
    // The elements of the array ARE NSDictionary
    for(NSDictionary *elemento in jsonRecibido)
    {
        // Use modern Obj-C syntax to get value from dictionary
        // Place them directly in the array.
        // No need to store them in separate strings.
        
        //Objeto para guardar las variables.
       //NSString *noc;
        
        
        //noc= elemento[@"aluctr"];
        //if([noc isEqualToString:numControl])
        //{
            [lblParcial8 setText:elemento[@"lispa1"]];
      
        //}
    }
    
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSString *user = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    NSString *password = [[NSUserDefaults standardUserDefaults] valueForKey:@"userPassword"];
    NSString *claveMateria = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentClaveGrupo"];
    NSString *claveGrupo = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentClaveMateria"];
    
    NSString *calificaURL=@"http://intertec.itculiacan.edu.mx/intertecmovil/califica.php?cadena=";
    
   
    
    calificaURL =[[[[[[[calificaURL stringByAppendingString:user]stringByAppendingString:@"-"]stringByAppendingString:password]stringByAppendingString:@"-"]stringByAppendingString:claveMateria]stringByAppendingString:@"-"]stringByAppendingString:claveGrupo];
    
    NSLog(calificaURL, @"HOlis" );
    
    NSURL *finalCalificaURL = [NSURL URLWithString:calificaURL];
    NSMutableURLRequest *solicitud = [NSMutableURLRequest requestWithURL:finalCalificaURL];
    
    //Establecemeos conexion
    conexion = [[NSURLConnection alloc]initWithRequest:solicitud delegate:self];
    
     NSLog(calificaURL);
    
    //Verificar conexion
    if(conexion) //si la conexion fue exitosa.
    {
        NSLog(@"Conexión establecida en califica");
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
