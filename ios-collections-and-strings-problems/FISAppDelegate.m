//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Test default array for frame
    NSArray *toFrame = @[@"Hello", @"World", @"in", @"a", @"frame"];
    [self frameTheWords:toFrame];
    
    //Test non-default long array for frame;
    NSArray *longggggggggFrame = @[@"WOOWWWWWWWWW", @"it", @"works", @"YAYYYYYYYYYYYYYYYYY", @"CELEBRATE!"];
    [self frameTheWords:longggggggggFrame];
    
    //Test default string for pig latin
    NSString *toPigLatin = @"The quick brown fox";
    [self translateToPigLatin:toPigLatin];
    
    //Test random string for pig latin
    NSString *toPigLatinRandom = @"Eldon is the best";
    [self translateToPigLatin:toPigLatinRandom];
    
    //Test default string for english
    NSString *toEnglish = @"Het uickq rownb oxf";
    [self translateToEnglish:toEnglish];
    
    //Test random string for english
    NSString *toEnglishRandom = @"Ldone si het estb";
    [self translateToEnglish:toEnglishRandom];
    
//  Test default list
    NSArray *defaultList1 = @[@"a", @"b", @"c"];
    NSArray *defaultList2 = @[@"1", @"2", @"3"];
    [self alternatingList:defaultList1 secondList:defaultList2];
    
    //Test LONGER 1st list
    NSArray *longerList1 = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    NSArray *longerList2 = @[@"1", @"2", @"3",];
    [self alternatingList:longerList1 secondList:longerList2];
    
    //Test LONGER 2nd list
    NSArray *longerList3 = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    NSArray *longerList4 = @[@"1", @"2", @"3", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11"];
    [self alternatingList:longerList3 secondList:longerList4];
    
    //TEST split default number
    NSInteger defaultNumber = 12045;
    [self splitIntoDigits:defaultNumber];
    
    //TEST split long random number
    NSInteger randomNumber = 9454935493854340;
    [self splitIntoDigits:randomNumber];
    
    //Test reversing array
    NSArray *toBeReverse = @[@"a", @"b", @"c", @"d"];
    [self reverseArray:toBeReverse];
    
    
    return YES;
}


-(NSString *)frameTheWords:(NSArray *)array{
    
    NSMutableString *framedWords = [[NSMutableString alloc]init];
    NSMutableString *topAndBottomFrame = [[NSMutableString alloc]initWithString:@"\n"];
    NSString *longest = nil;
    
    for(NSString *str in array) {
        if (longest == nil || [str length] > [longest length]) {
            longest = str;
        } 
    }
    
    for (NSUInteger i = 0; i < longest.length+4; i ++){
        
        [topAndBottomFrame appendString:@"*"];
    }
    
    [framedWords appendString:topAndBottomFrame];
    
    for (NSUInteger i = 0; i < array.count; i++ ){
        
        NSString *sideFrame = @"\n*";
        sideFrame = [sideFrame stringByAppendingFormat:@" %@",array[i]];
        
        while (sideFrame.length < longest.length+4) {
            sideFrame = [sideFrame stringByAppendingString:@" "];
        }
        
        sideFrame = [sideFrame stringByAppendingString:@"*"];
        [framedWords appendString:sideFrame];

    }
    
    [framedWords appendString: topAndBottomFrame];
    
    
    NSLog(@"%@", framedWords);
    return framedWords;
    

}

-(NSString *)translateToPigLatin:(NSString *)string{
    
    NSArray *stringsToTranslate = [string componentsSeparatedByString:@" "];
    NSMutableString *translated = [[NSMutableString alloc]init];
    
    for (NSString *words in stringsToTranslate){
        
        NSString *firstChar = [words.lowercaseString substringToIndex:1];
        NSString *remainders = [words.lowercaseString substringFromIndex:1];
        remainders = [remainders stringByAppendingString:firstChar];
        
        if (words == stringsToTranslate.firstObject){
            NSString *capFirst = [remainders capitalizedString];
            [translated appendString:capFirst];
        }
        
        else {
            [translated appendString:remainders];
        }
        
        if (!(words == stringsToTranslate.lastObject)){
            [translated appendString:@" "];
        }
        
        
    }

    
    NSLog(@"%@", translated);
    return translated;
}

-(NSString *)translateToEnglish:(NSString *)string{
    
    NSArray *stringsToTranslate = [string componentsSeparatedByString:@" "];
    NSMutableString *translated = [[NSMutableString alloc]init];
    
    for (NSString *words in stringsToTranslate){
        
        NSString *lastChar = [words.lowercaseString substringFromIndex:words.length-1];
        NSString *remainders = [words.lowercaseString substringToIndex:words.length-1];
        lastChar = [lastChar stringByAppendingString:remainders];
    
        if (words == stringsToTranslate.firstObject){
            NSString *capFirst = [lastChar capitalizedString];
            [translated appendString:capFirst];
        }
        
        else {
            [translated appendString:lastChar];
        }
        
        if (!(words == stringsToTranslate.lastObject)){
            [translated appendString:@" "];
        }
        
        
    }
    
    
    NSLog(@"%@", translated);
    return translated;
}

-(NSArray *)alternatingList:(NSArray *)firstList
                 secondList:(NSArray *)secondList{
    
    NSMutableArray *alternating = [[NSMutableArray alloc]init];

    if (firstList.count == secondList.count){
        for (NSUInteger i = 0; i < firstList.count; i++){
            
            [alternating addObject:firstList[i]];
            [alternating addObject:secondList[i]];
        }
    }
    
    if (firstList.count > secondList.count){

    NSIndexSet *remainder = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(secondList.count, firstList.count-secondList.count)];
    NSArray *remainderArray = [firstList objectsAtIndexes:remainder];
    
        NSLog(@"%@", remainderArray);

        for (NSUInteger i = 0; i < secondList.count; i++){
            
            [alternating addObject:firstList[i]];
            [alternating addObject:secondList[i]];
        }
        
        [alternating addObjectsFromArray:remainderArray];
    }
    
    if (firstList.count < secondList.count){
        
        NSIndexSet *remainder = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstList.count, secondList.count-firstList.count)];
        NSArray *remainderArray = [secondList objectsAtIndexes:remainder];
        
        NSLog(@"%@", remainderArray);
        
        for (NSUInteger i = 0; i < firstList.count; i++){
            
            [alternating addObject:secondList[i]];
            [alternating addObject:firstList[i]];
        }
        
        [alternating addObjectsFromArray:remainderArray];
    }

    NSLog (@"%@", alternating);
    return alternating;
}

-(NSArray *)splitIntoDigits:(NSInteger)number{
    
    NSMutableArray *digits = [[NSMutableArray alloc]init];
    NSString *numberToString = [NSString stringWithFormat:@"%li", number];
    
    for (NSUInteger i = 0; i < numberToString.length; i++ ){
        
        NSString *eachDigit = [NSString stringWithFormat:@"%c", [numberToString characterAtIndex:i]];
        
        [digits addObject:eachDigit];
        
    }
    
    NSLog(@"%@", digits);
    return digits;
}

-(NSArray *)reverseArray:(NSArray *)array{
    
    NSArray *reverse = [[array reverseObjectEnumerator] allObjects];
    
    NSLog(@"%@", reverse);
    return reverse;
}

@end
