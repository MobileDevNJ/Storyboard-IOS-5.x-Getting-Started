
#import "PlayerDetailsViewController.h"
#import "Player.h"
#import "GamePickerViewController.h"

#define groupCellCount 2
#define textFieldTag 100

@implementation PlayerDetailsViewController
{
	NSString* game;
}

@synthesize delegate;
@synthesize nameTextField;
@synthesize detailLabel;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
    game = @"Chess";
	self.detailLabel.text = game;
    
  }

- (void)viewDidUnload
{
	[self setNameTextField:nil];
	[self setDetailLabel:nil];
	[super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickGame"])
	{
		GamePickerViewController *gamePickerViewController = 
        segue.destinationViewController;
		gamePickerViewController.delegate = self;
		gamePickerViewController.game = game;
	}
}



- (IBAction)cancel:(id)sender
{
	[self.delegate playerDetailsViewControllerDidCancel:self];
}

- (IBAction)save:(id)sender
{
	Player *player = [[Player alloc] init];
    
	player.game = game;
	player.rating = 1;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section] ;
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    UITextField *textField = (UITextField*)[cell viewWithTag:textFieldTag];
    player.name = textField.text;
    
    
	[self.delegate playerDetailsViewController:self didAddPlayer:player];
}

#pragma mark - GamePickerViewControllerDelegate

- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)theGame
{
	game = theGame;
    self.detailLabel.text = game;
    [self.tableView reloadData];
	[self.navigationController popViewControllerAnimated:YES];
}

@end
