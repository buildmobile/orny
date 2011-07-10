//
//  BirdListViewController.m
//  Orny
//
//  Created by 3Easy on 23/05/11.
//  Copyright 2011 3Easy Web Org. All rights reserved.
//

#import "BirdListViewController.h"


@implementation BirdListViewController

@synthesize birds;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib {
    [self loadBirdData];
}

- (void)dealloc
{
    [birds release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITableViewDataSource methods

/**
 * Create a data structure containing information about some birds.
 * Eventually, we'll replace this with some CoreData interaction.
 */
-(void)loadBirdData {
    
    // The context is, roughly, the "database schema"
    NSManagedObjectContext *context = [(OrnyAppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    // A request is like an SQL select statement; we're retrieving some set of objects
    NSFetchRequest *request = [[NSFetchRequest alloc] init];

    // An entity description is used to specify which entit(y|ies) we want to pull from the context
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Species" inManagedObjectContext:context];
    [request setEntity:description];
    
    // A sort descriptor lets us order the results
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];

    // A fetchedResultsController handles the fetching of our data
    NSFetchedResultsController *fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    fetchController.delegate = self;

    NSError *error = nil;
    if(![fetchController performFetch:&error]) {
        // TODO: Handle error
        abort();
    }

    birds = fetchController.fetchedObjects;
    
    /*
    birds = [[NSMutableArray alloc] init];
    
    // Add a Magpie to our bird array
    [birds addObject:
     [NSDictionary 
      dictionaryWithObjects:[NSArray arrayWithObjects:@"Magpie", @"magpie", @"Black and white and crafty all over!", nil]
      forKeys:[NSArray arrayWithObjects:@"name", @"image", @"description", nil]
      ]
     ];
    
    // And another!
    [birds addObject:
     [NSDictionary dictionaryWithObjects:
      [NSArray arrayWithObjects:@"Rosella", @"rosella", @"A red and blue parrot", nil] 
                                 forKeys:[NSArray arrayWithObjects:@"name", @"image", @"description", nil]
      ]
     ];     
     */
}

/**
 * Return the number of rows for this section. We only have one section, so it's the count
 * of birds.
 */
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    return [birds count];
}

/**
 * Return a cell for a given path. The path tells us which row we're interacting with (and thus which
 * element in our ordered data structure of birds - and thus, indirectly, which bird).
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *newCell;
    
    if((newCell = [tableView dequeueReusableCellWithIdentifier:@"birdList"]) == nil) {
        newCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"birdList"] autorelease];
    }
    
    NSDictionary *thisBird = [birds objectAtIndex:[indexPath row]];
    
    UILabel *newCellLabel = [newCell textLabel];
    [newCellLabel setText:[thisBird objectForKey:@"name"]];
    
    return newCell;
}

/**
 * Depending on the style of table, we might show a header. 
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Some Birds";
}

/**
 * The user has selected a row. Respond to that.
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSDictionary *thisBird = [birds objectAtIndex:[indexPath row]];
    
    BirdListDetailViewController *detail = [[BirdListDetailViewController alloc] initWithNibName:@"BirdListDetailViewController" bundle:[NSBundle mainBundle]];
    detail.filename = [thisBird objectForKey:@"image"];

    [[self navigationController] pushViewController:detail animated:YES];
    
    [detail release];
    
}

@end
