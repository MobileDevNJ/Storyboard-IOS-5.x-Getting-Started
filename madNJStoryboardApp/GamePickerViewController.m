
#import "GamePickerViewController.h"

@implementation GamePickerViewController
{
	NSArray *games;
	NSUInteger selectedIndex;
}

@synthesize delegate;
@synthesize game;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    // set title
    self.navigationItem.title=@"Choose Game";

	games = [NSArray arrayWithObjects:
		@"Angry Birds",
		@"Chess",
		@"Russian Roulette",
		@"Spin the Bottle",
		@"Texas Hold'em Poker",
		@"Tic-Tac-Toe",
		nil];

	selectedIndex = [games indexOfObject:self.game];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	games = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
        
        cell.textLabel.text = [games objectAtIndex:indexPath.row];

	if (indexPath.row == selectedIndex)
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	if (selectedIndex != NSNotFound)
	{
		UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0]];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

	selectedIndex = indexPath.row;
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;

	NSString *theGame = [games objectAtIndex:indexPath.row];
	[self.delegate gamePickerViewController:self didSelectGame:theGame];
}

@end
