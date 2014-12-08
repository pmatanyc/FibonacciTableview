//
//  ViewController.m
//  FibonacciTableiew
//
//  Created by Paola Mata Maldonado on 12/7/14.
//  Copyright (c) 2014 Paola Mata Maldonado. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *tableDataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Fibonacci Sequence";
    
    [self loadData];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];

}

-(void)loadData{

    NSString *tempString;
    self.tableDataArray = [NSMutableArray new];
    int numItems = 100;
    
    double f1 = -1;
    double f2 = 1;
    
    double temp;
    
    for (int i=0; i<numItems; i++){
        
        temp = f1 + f2;
        f1 = f2;
        f2 = temp;
        
        tempString = [NSString stringWithFormat: @"%.f", temp];
        [self.tableDataArray addObject:tempString];
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableDataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.tableDataArray objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
