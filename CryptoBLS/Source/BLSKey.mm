#import "BLSKey.h"
#import <BigIntTypesBLS.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconversion"
#pragma clang diagnostic ignored "-Wunused-function"
#pragma clang diagnostic ignored "-Wconditional-uninitialized"
#pragma clang diagnostic ignored "-Wdocumentation"
#pragma clang diagnostic ignored "-Wmacro-redefined"
#import <bls.hpp>
#pragma clang diagnostic pop

@implementation BLSKey

// MARK: - Verification

+ (BOOL)verify:(NSData *)messageDigest publicKey:(NSData *)publicKeyData signature:(NSData *)signature {
    UInt256 message = *(UInt256 *) messageDigest.bytes;
    UInt384 pubKey = *(UInt384 *) publicKeyData.bytes;
    UInt768 sig = *(UInt768 *) signature.bytes;

    bls::PublicKey blsPublicKey = bls::PublicKey::FromBytes(pubKey.u8);
    bls::AggregationInfo aggregationInfo = bls::AggregationInfo::FromMsgHash(blsPublicKey, message.u8);
    bls::Signature blsSignature = bls::Signature::FromBytes(sig.u8, aggregationInfo);

    return blsSignature.Verify();
}

@end
