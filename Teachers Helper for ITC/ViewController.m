//
//  ViewController.m
//  Teachers Helper for ITC
//
//  Created by CCDM16 on 20/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Toast.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textUser, textPassword, indicador;



-(IBAction)btnSignIn:(id)sender{
    
    NSString *user = [textUser text];
    NSString *password = [textPassword text];
    
    
    if ([textUser hasText] && [textPassword hasText]) {
       
    }else{
        
        
        UIAlertController *action_view = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Completa todos los datos antes de continuar" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Ok pues" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            NSLog(@"asdhfgjk");
        }];
        
        [action_view addAction:cancel];
        
        // Present the alert to the user.
        [self presentViewController:action_view animated:YES completion:nil];
    
        
    }
   
    NSString *signInURL = @"http://intertec.itculiacan.edu.mx/intertecmovil/entrada.php?cadena=";
    
    signInURL = [[[signInURL stringByAppendingString:user]stringByAppendingString:@"-"]stringByAppendingString:password];
    NSURL *url = [NSURL URLWithString:signInURL];
    
    NSLog(signInURL, @"HOlis" );
    
    [[NSUserDefaults standardUserDefaults] setObject:user forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"userPassword"];
    [[NSUserDefaults standardUserDefaults] synchronize];
   
    
    
  
     NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    conexion = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (conexion)
    {
        NSLog(@"Conexión establecida");
        datosWeb = [NSMutableData data];
        [indicador setHidden:false];
        [indicador startAnimating];
    }
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    


}





//Inicia Métodos para delegado de conexión
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
    NSDictionary *jsonRecieved = [NSJSONSerialization JSONObjectWithData:datosWeb options:kNilOptions error:NULL];
    NSString *response = [jsonRecieved objectForKey:@"respuesta"];
    
    

    if ([response  intValue]==1)
    {
        NSLog(@"Entro");
        [self performSegueWithIdentifier:@"loginSuccess" sender:self];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"logged_in"];
        
        
    }else
    {
        NSLog(@"%@",response);
        
        
        UIAlertController *action_view = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"LA contrasena o el usuario estan mal" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Ok pues" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            NSLog(@"asdhfgjk");
            
            
           
        }];
        
        [action_view addAction:cancel];
        
        // Present the alert to the user.
        [self presentViewController:action_view animated:YES completion:nil];
        
    
    }
}
//Termina Métodos para delegado d
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
