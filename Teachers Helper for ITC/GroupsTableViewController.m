//
//  GroupsTableViewController.m
//  Teachers Helper for ITC
//
//  Created by CCDM16 on 25/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "GroupsTableViewController.h"
#import "DetailViewController.h"
#import "UIView+Toast.h"

@interface GroupsTableViewController()

@end

@implementation GroupsTableViewController

@synthesize varibaleGlobal, lunes, martes, miercoles, jueves, viernes, sabado, claveGrupo, claveMateria, nombreLargo;

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
        
        //Objeto para guardar las variables.
        FatherClass *group = [[FatherClass alloc]init];
        [group setSubjectKey:elemento[@"clavemateria"]];
        [group setLongNameSubject:elemento[@"nombremateria"]];
        [group setShortNameSubject:elemento[@"nombrecorto"]];
        [group setGroupKey:elemento[@"clavegrupo"]];
    
        //Lunes
        
        NSString* resultsMonday = @"";
        NSString* sourceMon = [elemento objectForKey:@"horalunes"];
        NSString* hh1Mon = [sourceMon substringWithRange:NSMakeRange(0, 2)];
        NSString* mm1Mon = [sourceMon substringWithRange:NSMakeRange(2, 2)];
        
        NSString* hh2Mon = [sourceMon substringWithRange:NSMakeRange(4, 2)];
        NSString* mm2Mon = [sourceMon substringWithRange:NSMakeRange(6, 2)];
        
        resultsMonday =[NSString stringWithFormat:@"%@:%@-%@:%@",hh1Mon,mm1Mon,hh2Mon,mm2Mon];
        
        //Martes
        NSString* resultsTuesday = @"";
        NSString* sourceTue = [elemento objectForKey:@"horamartes"];
        NSString* hh1Tue = [sourceTue substringWithRange:NSMakeRange(0, 2)];
        NSString* mm1Tue = [sourceTue substringWithRange:NSMakeRange(2, 2)];
        
        NSString* hh2Tue = [sourceTue substringWithRange:NSMakeRange(4, 2)];
        NSString* mm2Tue = [sourceTue substringWithRange:NSMakeRange(6, 2)];
        
        resultsTuesday =[NSString stringWithFormat:@"%@:%@-%@:%@",hh1Tue,mm1Tue,hh2Tue,mm2Tue];
        
        //Miercoles
        NSString* resultWednesday = @"";
        NSString* sourceWed = [elemento objectForKey:@"horamiercoles"];
        NSString* hh1Wed = [sourceWed substringWithRange:NSMakeRange(0, 2)];
        NSString* mm1Wed = [sourceWed substringWithRange:NSMakeRange(2, 2)];
        
        NSString* hh2Wed = [sourceWed substringWithRange:NSMakeRange(4, 2)];
        NSString* mm2Wed = [sourceWed substringWithRange:NSMakeRange(6, 2)];
        
        resultWednesday =[NSString stringWithFormat:@"%@:%@-%@:%@",hh1Wed,mm1Wed,hh2Wed,mm2Wed];
        
        //Jueves
        NSString* resultsThursday = @"";
        NSString* sourceTh = [elemento objectForKey:@"horajueves"];
        NSString* hh1Th = [sourceTh substringWithRange:NSMakeRange(0, 2)];
        NSString* mm1Th = [sourceTh substringWithRange:NSMakeRange(2, 2)];
        
        NSString* hh2Th = [sourceTh substringWithRange:NSMakeRange(4, 2)];
        NSString* mm2Th = [sourceTh substringWithRange:NSMakeRange(6, 2)];
        
        resultsThursday =[NSString stringWithFormat:@"%@:%@-%@:%@",hh1Th,mm1Th,hh2Th,mm2Th];
        
        //Viernes
        NSString* resultsFriday = @"";
        NSString* sourceFr = [elemento objectForKey:@"horaviernes"];
        NSString* hh1Fr = [sourceFr substringWithRange:NSMakeRange(0, 2)];
        NSString* mm1Fr = [sourceFr substringWithRange:NSMakeRange(2, 2)];
        
        NSString* hh2Fr = [sourceFr substringWithRange:NSMakeRange(4, 2)];
        NSString* mm2Fr = [sourceFr substringWithRange:NSMakeRange(6, 2)];
        
        resultsFriday =[NSString stringWithFormat:@"%@:%@-%@:%@",hh1Fr,mm1Fr,hh2Fr,mm2Fr];
        
    
        [group setMondaySchedule:resultsMonday];
        [group setThursdaySchedule:resultsThursday];
        [group setWednesdaySchedule:resultWednesday];
        [group setTuesdaySchedule:resultsTuesday];
        [group setFridaySchedule:resultsFriday];
        
        [groupArray addObject:group];
    }
    
    [self.tableView reloadData];
}
//Termina Métodos para delegado de conexión


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *user = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    NSString *password = [[NSUserDefaults standardUserDefaults] valueForKey:@"userPassword"];
    
    
    
   
    
    
    //Inicializamos el arreglo de Personajes.
    groupArray = [[NSMutableArray alloc]initWithCapacity:15];
    NSString *groupsURL=@"http://intertec.itculiacan.edu.mx/intertecmovil/grupos.php?cadena=";
    
    groupsURL = [[[groupsURL stringByAppendingString:user]stringByAppendingString:@"-"]stringByAppendingString:password];
    

    
    NSURL *finalGroupsURL = [NSURL URLWithString:groupsURL];
    NSMutableURLRequest *solicitud = [NSMutableURLRequest requestWithURL:finalGroupsURL];
    
    //Establecemeos conexion
    conexion = [[NSURLConnection alloc]initWithRequest:solicitud delegate:self];
    
    //Verificar conexion
    if(conexion) //si la conexion fue exitosa.
    {
        NSLog(@"Conexión establecida en grupos");
        datosWeb = [NSMutableData data]; //Inicializa datosWeb.
     
    }
    
    
    BOOL bandera;
    
    if (bandera) {
        NSString *welcome = @"Hola, ";
        welcome = [[welcome stringByAppendingString:@"bienvenido "]stringByAppendingString:user];
        
        [self.view makeToast:welcome
                    duration:3.0
                    position:CSToastPositionCenter];
        bandera = false;
    }
    
 

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
    return [groupArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupsRow" forIndexPath:indexPath];
    
    // Configure the cell...
    FatherClass *temporal = [groupArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [temporal shortNameSubject];
    
    
    cell.detailTextLabel.text = [temporal mondaySchedule];
    return cell;
   
    
}

-(void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
   FatherClass *group = [groupArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    
    varibaleGlobal = [group shortNameSubject];
    lunes = [group mondaySchedule];
    martes = [group tuesdaySchedule];
    miercoles = [group wednesdaySchedule];
    jueves = [group thursdaySchedule];
    viernes = [group fridaySchedule];
    claveMateria = [group subjectKey];
    nombreLargo = [group longNameSubject];
    claveGrupo = [group groupKey];
    
    
 
    
    [self performSegueNow];
    
}

-(void) performSegueNow
{
    [self performSegueWithIdentifier:@"Details" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Details"]) {
        
        DetailViewController *dvc = [segue destinationViewController];
        dvc.details = varibaleGlobal;
        dvc.lunes = lunes;
        dvc.martes = martes;
        dvc.miercoles = miercoles;
        dvc.jueves = jueves;
        dvc.viernes = viernes;
        dvc.claveGrupo = claveGrupo;
        dvc.claveMateria = claveMateria;
        dvc.nombreLargo = nombreLargo;
        
    }
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
