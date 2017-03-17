// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Laptop.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Manufacturer;

@interface LaptopID : NSManagedObjectID {}
@end

@interface _Laptop : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LaptopID *objectID;

@property (nonatomic, strong, nullable) NSNumber* id;

@property (atomic) int64_t idValue;
- (int64_t)idValue;
- (void)setIdValue:(int64_t)value_;

@property (nonatomic, strong, nullable) NSString* model;

@property (nonatomic, strong, nullable) NSString* type;

@property (nonatomic, strong, nullable) Manufacturer *manufactured;

@end

@interface _Laptop (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSNumber*)primitiveId;
- (void)setPrimitiveId:(nullable NSNumber*)value;

- (int64_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int64_t)value_;

- (nullable NSString*)primitiveModel;
- (void)setPrimitiveModel:(nullable NSString*)value;

- (Manufacturer*)primitiveManufactured;
- (void)setPrimitiveManufactured:(Manufacturer*)value;

@end

@interface LaptopAttributes: NSObject 
+ (NSString *)id;
+ (NSString *)model;
+ (NSString *)type;
@end

@interface LaptopRelationships: NSObject
+ (NSString *)manufactured;
@end

NS_ASSUME_NONNULL_END
