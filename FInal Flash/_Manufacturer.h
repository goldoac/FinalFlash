// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Manufacturer.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Laptop;

@interface ManufacturerID : NSManagedObjectID {}
@end

@interface _Manufacturer : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ManufacturerID *objectID;

@property (nonatomic, strong, nullable) NSString* address;

@property (nonatomic, strong, nullable) NSNumber* id;

@property (atomic) int64_t idValue;
- (int64_t)idValue;
- (void)setIdValue:(int64_t)value_;

@property (nonatomic, strong, nullable) NSString* name;

@property (nonatomic, strong, nullable) NSSet<Laptop*> *creates;
- (nullable NSMutableSet<Laptop*>*)createsSet;

@end

@interface _Manufacturer (CreatesCoreDataGeneratedAccessors)
- (void)addCreates:(NSSet<Laptop*>*)value_;
- (void)removeCreates:(NSSet<Laptop*>*)value_;
- (void)addCreatesObject:(Laptop*)value_;
- (void)removeCreatesObject:(Laptop*)value_;

@end

@interface _Manufacturer (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(nullable NSString*)value;

- (nullable NSNumber*)primitiveId;
- (void)setPrimitiveId:(nullable NSNumber*)value;

- (int64_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int64_t)value_;

- (nullable NSString*)primitiveName;
- (void)setPrimitiveName:(nullable NSString*)value;

- (NSMutableSet<Laptop*>*)primitiveCreates;
- (void)setPrimitiveCreates:(NSMutableSet<Laptop*>*)value;

@end

@interface ManufacturerAttributes: NSObject 
+ (NSString *)address;
+ (NSString *)id;
+ (NSString *)name;
@end

@interface ManufacturerRelationships: NSObject
+ (NSString *)creates;
@end

NS_ASSUME_NONNULL_END
