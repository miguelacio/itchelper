//
//  ProgramedAndRealDatesByGroupTableViewController.m
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 10/12/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "ProgramedAndRealDatesByGroupTableViewController.h"
#import "FatherClass.h"


@interface ProgramedAndRealDatesByGroupTableViewController ()

@end

@implementation ProgramedAndRealDatesByGroupTableViewController

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
        // Use modern Obj-C syntax to get value from dictionary
        // Place them directly in the array.
        // No need to store them in separate strings.
        
        
        programmed01 = elemento[@"uni01prog"];
        programmed02 = elemento[@"uni02prog"];
        programmed03 = elemento[@"uni03prog"];
        programmed04 = elemento[@"uni04prog"];
        programmed05 = elemento[@"uni05prog"];
        programmed06 = elemento[@"uni06prog"];
        programmed07 = elemento[@"uni07prog"];
        programmed08 = elemento[@"uni08prog"];
        programmed09 = elemento[@"uni09prog"];
        programmed10 = elemento[@"uni10prog"];
        programmed11 = elemento[@"uni11prog"];
        programmed12 = elemento[@"uni12prog"];
        programmed13 = elemento[@"uni13prog"];
        programmed14 = elemento[@"uni14prog"];
        programmed15 = elemento[@"uni15prog"];
        
        real01 = elemento[@"uni01real"];
        real02 = elemento[@"uni02real"];
        real03 = elemento[@"uni03real"];
        real04 = elemento[@"uni04real"];
        real05 = elemento[@"uni05real"];
        real06 = elemento[@"uni06real"];
        real07 = elemento[@"uni07real"];
        real08 = elemento[@"uni08real"];
        real09 = elemento[@"uni09real"];
        real10 = elemento[@"uni10real"];
        real11 = elemento[@"uni11real"];
        real12 = elemento[@"uni12real"];
        real13 = elemento[@"uni13real"];
        real14 = elemento[@"uni14real"];
        real15 = elemento[@"uni15real"];
    
            }
    
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *user = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    NSString *password = [[NSUserDefaults standardUserDefaults] valueForKey:@"userPassword"];
    NSString *claveMateria = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentClaveGrupo"];
    NSString *claveGrupo = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentClaveMateria"];
    
    
    
    //Inicializamos el arreglo de Personajes.
    examsArray = [[NSMutableArray alloc]initWithCapacity:15];
    NSString *examsURL=@"http://intertec.itculiacan.edu.mx/intertecmovil/unidadesexa.php?cadena=";
    
    
    
    examsURL = [[[[[[[examsURL stringByAppendingString:user]stringByAppendingString:@"-"]stringByAppendingString:password]stringByAppendingString:@"-"]stringByAppendingString:claveGrupo]stringByAppendingString:@"-" ]stringByAppendingString:claveMateria];
    
    examsURL = [examsURL stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSURL *finalExamsURL = [NSURL URLWithString:examsURL];
    NSMutableURLRequest *solicitud = [NSMutableURLRequest requestWithURL:finalExamsURL];
    
    //Establecemeos conexion
    conexion = [[NSURLConnection alloc]initWithRequest:solicitud delegate:self];
    
    //Verificar conexion
    if(conexion) //si la conexion fue exitosa.
    {
        NSLog(@"Conexión establecida en Examenes");
        datosWeb = [NSMutableData data]; //Inicializa datosWeb.
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"datesRow" forIndexPath:indexPath];
    
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 1 programada: %@", programmed01];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 1 real: %@", real01];
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 2 programada: %@", programmed02];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 2 real: %@", real02];
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 3 programada: %@", programmed03];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 3 real: %@", real03];
            break;
        case 3:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 4 programada: %@", programmed04];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 4 real: %@", real04];
            break;
        case 4:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 5 programada: %@", programmed05];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 5 real: %@", real05];
            break;
        case 5:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 6 programada: %@", programmed06];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 6 real: %@", real06];
            break;
        case 6:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 7 programada: %@", programmed07];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 7 real: %@", real07];
            break;
        case 7:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 8 programada: %@", programmed08];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 8 real: %@", real08];
            break;
        case 8:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 9 programada: %@", programmed09];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 9 real: %@", real09];
            break;
        case 9:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 10 programada: %@", programmed10];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 10 real: %@", real10];
            break;
        case 10:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 11 programada: %@", programmed11];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 11 real: %@", real11];
            break;
        case 11:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 12 programada: %@", programmed12];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 12 real: %@", real12];
            break;
        case 12:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 13 programada: %@", programmed13];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 13 real: %@", real13];
            break;
        case 13:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 14 programada: %@", programmed14];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 14 real: %@", real14];
            break;
        case 14:
            cell.textLabel.text = [NSString stringWithFormat:@"Unidad 15 programada: %@", programmed15];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"Unidad 15 real: %@", real15];
            break;
        default:
            break;
    }
    
    return cell;
}

@end
