//
//  StudentsTableViewController.m
//  Teachers Helper for ITC
//
//  Created by Jesus Flores on 30/11/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import "StudentsTableViewController.h"
#import "FatherClass.h"

@interface StudentsTableViewController ()

@end

@implementation StudentsTableViewController


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
        FatherClass *students = [[FatherClass alloc]init];
        
        [students setFullName:elemento[@"nombre"]];
        [students setNControl:elemento[@"ncontrol"]];
        
        [StudentArray addObject:students];
    }
    
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Inicializamos el arreglo de Personajes.
    StudentArray = [[NSMutableArray alloc]initWithCapacity:15];
    NSString *studentsURL=@"http://intertec.itculiacan.edu.mx/intertecmovil/alumnos.php?cadena=920-12345678-AEB1011-9A";
    NSURL *finalStudentsURL = [NSURL URLWithString:studentsURL];
    NSMutableURLRequest *solicitud = [NSMutableURLRequest requestWithURL:finalStudentsURL];
    
    //Establecemeos conexion
    conexion = [[NSURLConnection alloc]initWithRequest:solicitud delegate:self];
    
    //Verificar conexion
    if(conexion) //si la conexion fue exitosa.
    {
        NSLog(@"Conexión establecida en estudiantes");
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
    return [StudentArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentsRow" forIndexPath:indexPath];
    
    
    FatherClass *temporal = [StudentArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [temporal fullName];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end