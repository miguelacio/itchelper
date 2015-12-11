//
//  DatesforUnitiesViewController.m
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 10/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "DatesforUnitiesViewController.h"
#import "FatherClass.h"
#import "QuartzCore/QuartzCore.h"

@interface DatesforUnitiesViewController ()

@end

@implementation DatesforUnitiesViewController
@synthesize lblrealprogramada, lblFinalProgramada, lblFinalReal, lblInicialReal;

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
    
    
    // The elements of the array ARE NSDictionary
    for(NSDictionary *elemento in jsonRecibido)
    {
     
        FatherClass *unity = [[FatherClass alloc]init];
        
        [unity setUnity:elemento[@"unidad"]];
        [unity setLastProgrammedDate:elemento[@"fechafinalprog"]];
        [unity setLastRealDate:elemento[@"fechafinalreal"]];
        [unity setFirstProgammedDate:elemento[@"fechainicialprog"]];
        [unity setFirstRealDate:elemento[@"fechainicialreal"]];
        
        [unitArray addObject:unity];
    }
    
    [self.tableViewUnidades reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableViewUnidades.layer.borderWidth = 1.5;
    self.tableViewUnidades.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    
    NSString *user = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    NSString *password = [[NSUserDefaults standardUserDefaults] valueForKey:@"userPassword"];
    NSString *claveMateria = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentClaveGrupo"];
    NSString *claveGrupo = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentClaveMateria"];
    
    
    
    //Inicializamos el arreglo de Personajes.
    unitArray = [[NSMutableArray alloc]initWithCapacity:15];
    NSString *studentsURL=@"http://intertec.itculiacan.edu.mx/intertecmovil/unidadesmat.php?cadena=";
    
    
    
    studentsURL = [[[[[[[studentsURL stringByAppendingString:user]stringByAppendingString:@"-"]stringByAppendingString:password]stringByAppendingString:@"-"]stringByAppendingString:claveGrupo]stringByAppendingString:@"-" ]stringByAppendingString:claveMateria];
    
    studentsURL = [studentsURL stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSURL *finalStudentsURL = [NSURL URLWithString:studentsURL];
    NSMutableURLRequest *solicitud = [NSMutableURLRequest requestWithURL:finalStudentsURL];
    
    //Establecemeos conexion
    conexion = [[NSURLConnection alloc]initWithRequest:solicitud delegate:self];
    
    //Verificar conexion
    if(conexion) //si la conexion fue exitosa.
    {
        NSLog(@"Conexión establecida en unidades");
        datosWeb = [NSMutableData data]; //Inicializa datosWeb.
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return [unitArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"unityRow" forIndexPath:indexPath];
    
    
    FatherClass *temporal = [unitArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [temporal unity];
    return cell;
}
-(void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    FatherClass *temporal = [unitArray objectAtIndex:self.tableViewUnidades.indexPathForSelectedRow.row];
    
    lblrealprogramada.text = [temporal firstProgammedDate];
    lblFinalReal.text = [temporal lastRealDate];
    lblFinalProgramada.text = [temporal lastProgrammedDate];
    lblInicialReal.text = [temporal firstRealDate];
    
    
    
    
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
