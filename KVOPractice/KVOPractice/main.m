//
//  main.m
//  KVOPractice
//
//  Created by miyaeyo on 2015. 9. 15..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *me = [[Person alloc]init];
        Dog *minky = [[Dog alloc]init];
        
        [minky addObserver:me
                forKeyPath:@"hunger"
                   options:NSKeyValueObservingOptionNew
                   context:NULL];
        
        [minky setHunger:43];
        
        [minky willChangeValueForKey:@"hunger"];
        [minky changeHunger:25]; //이것만 쓰면 me 에서 detection못함
        [minky didChangeValueForKey:@"hunger"];
        
        
        [minky removeObserver:me forKeyPath:@"hunger"];
        
        [me release];
        [minky release];
       
    }
    return 0;
}
