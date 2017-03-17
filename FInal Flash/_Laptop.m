// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Laptop.m instead.

#import "_Laptop.h"

@implementation LaptopID
@end

@implementation _Laptop

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Laptop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Laptop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Laptop" inManagedObjectContext:moc_];
}

- (LaptopID*)objectID {
	return (LaptopID*)[super objectID];
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

@dynamic model;

@dynamic type;

@dynamic manufactured;

@end

@implementation LaptopAttributes 
+ (NSString *)id {
	return @"id";
}
+ (NSString *)model {
	return @"model";
}
+ (NSString *)type {
	return @"type";
}
@end

@implementation LaptopRelationships 
+ (NSString *)manufactured {
	return @"manufactured";
}
@end

