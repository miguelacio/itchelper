//
//  FatherClass.h
//  Teachers Helper for ITC
//
//  Created by Jorge Carrillo Cabanillas on 11/25/15.
//  Copyright © 2015 TecDeCuliacan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FatherClass : NSObject
{
    
    
    //Grupo
    NSString *subjectKey;
    NSString *longNameSubject;
    NSString *shortNameSubject;
    NSString *groupKey;
    NSString *mondaySchedule;
    NSString *tuesdaySchedule;
    NSString *wednesdaySchedule;
    NSString *thursdaySchedule;
    NSString *fridaySchedule;
    
    //Alumno
    NSString *nControl;
    NSString *fullName;
    
    
    
}
@property(nonatomic,strong) NSString *subjectKey;
@property(nonatomic,strong) NSString *longNameSubject;
@property(nonatomic,strong) NSString *shortNameSubject;
@property(nonatomic,strong) NSString *groupKey;
@property(nonatomic,strong) NSString *mondaySchedule;
@property(nonatomic,strong) NSString *tuesdaySchedule;
@property(nonatomic,strong) NSString *wednesdaySchedule;
@property(nonatomic,strong) NSString *thursdaySchedule;
@property(nonatomic,strong) NSString *fridaySchedule;
@property(nonatomic,strong) NSString *nControl;
@property(nonatomic,strong) NSString *fullName;

@end
