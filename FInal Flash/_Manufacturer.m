// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Manufacturer.m instead.

#import "_Manufacturer.h"

@implementation ManufacturerID
@end

@implementation _Manufacturer

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Manufacturer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Manufacturer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Manufacturer" inManagedObjectContext:moc_];
}

- (ManufacturerID*)objectID {
	return (ManufacturerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic address;

@dynamic id;

- (int64_t)idValue {
	NSNumber *result = [self id];
	return [result longLongValue];
}

- (void)setIdValue:(int64_t)value_ {
	[self setId:@(value_)];
}

- (int64_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result longLongValue];
}

- (void)setPrimitiveIdValue:(int64_t)value_ {
	[self setPrimitiveId:@(value_)];
}

@dynamic name;

@dynamic creates;

- (NSMutableSet<Laptop*>*)createsSet {
	[self willAccessValueForKey:@"creates"];

	NSMutableSet<Laptop*> *result = (NSMutableSet<Laptop*>*)[self mutableSetValueForKey:@"creates"];

	[self didAccessValueForKey:@"creates"];
	return result;
}

@end

@implementation ManufacturerAttributes 
+ (NSString *)address {
	return @"address";
}
+ (NSString *)id {
	return @"id";
}
+ (NSString *)name {
	return @"name";
}
@end

@implementation ManufacturerRelationships 
+ (NSString *)creates {
	return @"creates";
}
@end

