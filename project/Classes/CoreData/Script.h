//
//  Script.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Pallas Software. All rights reserved.
//

#import "GenericManagedObject.h"


#define SCRIPT_ENTITY_NAME				@"Script"

#define SCRIPT_KEY_TITLE				@"title"
#define SCRIPT_KEY_CONTENT				@"content"
#define SCRIPT_KEY_CREATDATE			@"creatDate"
#define SCRIPT_KEY_MODIFDATE			@"modifDate"


@interface Script : GenericManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * creatDate;
@property (nonatomic, retain) NSDate * modifDate;

@end
