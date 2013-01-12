//
//  AppDelegate.m
//  study20120112
//
//  Created by 隅田 浩司 on 2013/01/12.
//  Copyright (c) 2013年 hiroshi sumida. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
  [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.window.backgroundColor=[UIColor whiteColor];
  for(int i=0;i<3;i++){
    count[i]=2;
  }
  tableview=[[[UITableView alloc]initWithFrame:
                           [UIScreen mainScreen].applicationFrame
                            style:UITableViewStylePlain]autorelease];
  [self addEditbutton];
  [self.window addSubview:tableview];
  tableview.dataSource=self;
  [self.window makeKeyAndVisible];
  return YES;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return count[section];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier=@"Cell";
  UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if(cell==nil){
    cell=[[[UITableViewCell alloc]initWithStyle:
           UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
  }
  cell.textLabel.text=[NSString stringWithFormat:@"　項目　%d-%d", indexPath.section, indexPath.row];
  return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  count[indexPath.section]--;
  [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
  
}

-(void)addEditbutton
{
  UIButton* editButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
  [editButton setTitle:@"Edit" forState:UIControlStateNormal];
  [editButton addTarget:self action:@selector(changeMode:) forControlEvents:UIControlEventTouchUpInside];
  [self.window addSubview:editButton];
  
  CGRect frame=tableview.frame;
  frame.size.height=44;
  editButton.frame=CGRectInset(frame,4,4);
  frame.origin.y+=frame.size.height;
  frame.size.height=tableview.frame.size.height-frame.size.height;
  tableview.frame=frame;
}

-(void)changeMode:(UIButton*)button
{
  [tableview setEditing:!tableview.editing animated:YES];
  [button setTitle:tableview.editing?@"Done":@"Edit" forState:UIControlStateNormal];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
