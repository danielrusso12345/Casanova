

#import "NSString+SBJSON.h"
#import "SBJsonParser.h"

static const SBJsonParser *jsonParser;

@implementation NSString (NSString_SBJSON)

- (id)JSONFragmentValue
{
	if (!jsonParser)
		jsonParser = [SBJsonParser new];
    
    id repr = [jsonParser fragmentWithString:self];
    if (repr)
        return repr;
    
    NSLog(@"-JSONFragmentValue failed. Error trace is: %@", [jsonParser errorTrace]);
    return nil;
}

- (id)JSONValue
{
	if (!jsonParser)
		jsonParser = [SBJsonParser new];
    
    id repr = [jsonParser objectWithString:self];
    if (repr)
        return repr;
    
    NSLog(@"-JSONValue failed. Error trace is: %@", [jsonParser errorTrace]);
    return nil;
}

@end
