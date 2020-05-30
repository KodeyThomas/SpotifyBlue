#import <tweak-Structs.h>
@class NSString;

@interface BluetoothDevice : NSObject {

	NSString* _name;
	NSString* _address;
	BTDeviceImplRef _device;
	unsigned _connectingServiceMask;

}
-(void)dealloc;
-(id)description;
-(id)name;
-(id)copyWithZone:(NSZone*)arg1 ;
-(int)type;
-(long long)compare:(id)arg1 ;
-(id)address;
-(void)disconnect;
-(BTDeviceImplRef)device;
-(BOOL)isAppleAudioDevice;
-(void)connect;
-(int)batteryLevel;
-(BOOL)connected;
-(unsigned)vendorId;
-(unsigned long long)connectedServices;
-(BOOL)magicPaired;
-(void)setDevice:(BTDeviceImplRef)arg1 ;
-(BOOL)paired;
-(unsigned)productId;
-(void)setPIN:(id)arg1 ;
-(BOOL)setUserName:(id)arg1 ;
-(BOOL)featureCapability:(int)arg1 ;
-(void)unpair;
-(void)_clearName;
-(id)initWithDevice:(BTDeviceImplRef)arg1 address:(id)arg2 ;
-(BOOL)_isNameCached;
-(unsigned)majorClass;
-(unsigned)minorClass;
-(id)scoUID;
-(id)aclUID;
-(BOOL)cloudPaired;
-(BOOL)isTemporaryPaired;
-(unsigned long long)connectedServicesCount;
-(BOOL)supportsBatteryLevel;
-(BOOL)inEarDetectEnabled;
-(BOOL)setInEarDetectEnabled:(BOOL)arg1 ;
-(unsigned)micMode;
-(BOOL)setMicMode:(unsigned)arg1 ;
-(unsigned)doubleTapAction;
-(BOOL)setDoubleTapAction:(unsigned)arg1 ;
-(unsigned)doubleTapCapability;
-(unsigned)doubleTapActionEx:(unsigned*)arg1 rightAction:(unsigned*)arg2 ;
-(BOOL)setDoubleTapActionEx:(unsigned)arg1 rightAction:(unsigned)arg2 ;
-(unsigned)listeningMode;
-(BOOL)setListeningMode:(unsigned)arg1 ;
-(int)accessorySettingFeatureBitMask;
-(BOOL)magicPairedDeviceNameUpdated;
-(BOOL)isAccessory;
-(BOOL)isServiceSupported:(unsigned)arg1 ;
-(id)getServiceSetting:(unsigned)arg1 key:(id)arg2 ;
-(void)setServiceSetting:(unsigned)arg1 key:(id)arg2 value:(id)arg3 ;
-(void)connectWithServices:(unsigned)arg1 ;
-(void)acceptSSP:(long long)arg1 ;
-(void)startVoiceCommand;
-(void)endVoiceCommand;
-(SCD_Struct_Bl2)syncSettings;
-(void)setSyncSettings:(SCD_Struct_Bl2)arg1 ;
-(id)syncGroups;
-(void)setSyncGroup:(int)arg1 enabled:(BOOL)arg2 ;
-(BOOL)supportsHS;
-(BOOL)isProController;
-(void)setConnectingServicemask:(unsigned)arg1 ;
-(unsigned)getConnectingServiceMask;
-(int)getLowSecurityStatus;
@end