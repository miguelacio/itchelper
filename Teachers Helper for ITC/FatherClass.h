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
    
    //Calificaciones
    NSString *parcial1;
    NSString *parcial2;
    NSString *parcial3;
    NSString *parcial4;
    NSString *parcial5;
    NSString *parcial6;
    NSString *parcial7;
    NSString *parcial8;
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
@property(nonatomic,strong) NSString *parcial1;
@property(nonatomic,strong) NSString *parcial2;
@property(nonatomic,strong) NSString *parcial3;
@property(nonatomic,strong) NSString *parcial4;
@property(nonatomic,strong) NSString *parcial5;
@property(nonatomic,strong) NSString *parcial6;
@property(nonatomic,strong) NSString *parcial7;
@property(nonatomic,strong) NSString *parcial8;

@end
