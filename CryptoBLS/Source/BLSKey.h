#import <Foundation/Foundation.h>

@interface BLSKey: NSObject

+ (BOOL)verify:(NSData *)messageDigest publicKey:(NSData *)publicKeyData signature:(NSData *)signature;

@end
