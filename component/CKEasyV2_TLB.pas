unit CKEasyV2_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 45604 $
// File generated on 10/05/2018 13:39:07 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\system32\CKeasyV2.dll (1)
// LIBID: {DFA2B5C0-712F-401C-B08C-CF41C4C365FA}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CKEasyV2MajorVersion = 2;
  CKEasyV2MinorVersion = 7;

  LIBID_CKEasyV2: TGUID = '{DFA2B5C0-712F-401C-B08C-CF41C4C365FA}';

  IID__EasyCashKeeper: TGUID = '{55B4C997-732F-4296-8E51-22C48AA801B6}';
  CLASS_EasyCashKeeper: TGUID = '{84A5426E-49F2-4CD8-85EF-AA5AF032F240}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum CBC_Modes
type
  CBC_Modes = TOleEnum;
const
  CBC_Normal = $00000000;
  CBC_Disable_Config = $00000001;
  CBC_Disable_Actions = $00000004;
  CBC_Blind = $00000007;
  CBC_Blind_By_Value = $0000000F;

// Constants for enum CKL_Levels
type
  CKL_Levels = TOleEnum;
const
  CKL_Initial = $00000000;
  CKL_Max = $00000001;
  CKL_Current = $00000002;
  CKL_CashBox = $00000003;
  CKL_LevelStatus = $00000004;
  CKL_Inhibits = $00000005;

// Constants for enum CKD_Devices
type
  CKD_Devices = TOleEnum;
const
  CKD_Coins = $00000000;
  CKD_Notes = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _EasyCashKeeper = interface;
  _EasyCashKeeperDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  EasyCashKeeper = _EasyCashKeeper;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//

  EasyCashKeeper___v0 = _EasyCashKeeper; 
  EasyCashKeeper___v1 = _EasyCashKeeper; 
  EasyCashKeeper___v2 = _EasyCashKeeper; 
  EasyCashKeeper___v3 = _EasyCashKeeper; 

// *********************************************************************//
// Interface: _EasyCashKeeper
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {55B4C997-732F-4296-8E51-22C48AA801B6}
// *********************************************************************//
  _EasyCashKeeper = interface(IDispatch)
    ['{55B4C997-732F-4296-8E51-22C48AA801B6}']
    function Get_ErrorCode: Smallint; safecall;
    procedure Set_ErrorCode(ErrorCode: Smallint); safecall;
    function Get_ErrorDescription: WideString; safecall;
    procedure Set_ErrorDescription(const ErrorDescription: WideString); safecall;
    function Get_BackColor: Integer; safecall;
    procedure Set_BackColor(Param1: Integer); safecall;
    function Get_InverseColor: Integer; safecall;
    procedure Set_InverseColor(Param1: Integer); safecall;
    function Get_IP: WideString; safecall;
    procedure Set_IP(const Param1: WideString); safecall;
    function Connect: WordBool; safecall;
    procedure Disconnect; safecall;
    function Change(var PaidInValue: Integer; var PaidOutValue: Integer): WordBool; safecall;
    function AddChange(var PaidInValue: Integer): WordBool; safecall;
    function Pay(ValueInCents: Integer; var PaidOutValue: Integer): WordBool; safecall;
    function Charge(ValueInCents: Integer; var PaidInValue: Integer; var PaidOutValue: Integer): WordBool; safecall;
    function CashBoxControl(Mode: CBC_Modes; var CoinsValueInCB: Integer; 
                            var NotesValueInCB: Integer; var RemainingChange: Integer): WordBool; safecall;
    function Configuration: WordBool; safecall;
    function GetAmounts(var Denoms: WideString; var Quantities: WideString; var Value: Integer): WordBool; safecall;
    function EmptyCashBox(Device: CKD_Devices; var Value: Integer): WordBool; safecall;
    function GetLevels(LevelType: CKL_Levels; var Denoms: WideString; var Levels: WideString): WordBool; safecall;
    function ErrorManage(code: Integer; const Description: WideString; 
                         var Device_Available: WordBool): WordBool; safecall;
    function Get_UnikeID: WideString; safecall;
    function PaySpecific(Amount: Integer; var PaidOutValue: Integer): WordBool; safecall;
    function Get_OnErrorDiscard: WordBool; safecall;
    procedure Set_OnErrorDiscard(OnErrorDiscard: WordBool); safecall;
    function Get_ShowDecimals: Byte; safecall;
    function Get_AmountFactor: Byte; safecall;
    property ErrorCode: Smallint read Get_ErrorCode write Set_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription write Set_ErrorDescription;
    property BackColor: Integer read Get_BackColor write Set_BackColor;
    property InverseColor: Integer read Get_InverseColor write Set_InverseColor;
    property IP: WideString read Get_IP write Set_IP;
    property UnikeID: WideString read Get_UnikeID;
    property OnErrorDiscard: WordBool read Get_OnErrorDiscard write Set_OnErrorDiscard;
    property ShowDecimals: Byte read Get_ShowDecimals;
    property AmountFactor: Byte read Get_AmountFactor;
  end;

// *********************************************************************//
// DispIntf:  _EasyCashKeeperDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {55B4C997-732F-4296-8E51-22C48AA801B6}
// *********************************************************************//
  _EasyCashKeeperDisp = dispinterface
    ['{55B4C997-732F-4296-8E51-22C48AA801B6}']
    property ErrorCode: Smallint dispid 1073938455;
    property ErrorDescription: WideString dispid 1073938456;
    property BackColor: Integer dispid 1745027096;
    property InverseColor: Integer dispid 1745027095;
    property IP: WideString dispid 1745027094;
    function Connect: WordBool; dispid 1610809370;
    procedure Disconnect; dispid 1610809371;
    function Change(var PaidInValue: Integer; var PaidOutValue: Integer): WordBool; dispid 1610809372;
    function AddChange(var PaidInValue: Integer): WordBool; dispid 1610809373;
    function Pay(ValueInCents: Integer; var PaidOutValue: Integer): WordBool; dispid 1610809374;
    function Charge(ValueInCents: Integer; var PaidInValue: Integer; var PaidOutValue: Integer): WordBool; dispid 1610809375;
    function CashBoxControl(Mode: CBC_Modes; var CoinsValueInCB: Integer; 
                            var NotesValueInCB: Integer; var RemainingChange: Integer): WordBool; dispid 1610809376;
    function Configuration: WordBool; dispid 1610809377;
    function GetAmounts(var Denoms: WideString; var Quantities: WideString; var Value: Integer): WordBool; dispid 1610809380;
    function EmptyCashBox(Device: CKD_Devices; var Value: Integer): WordBool; dispid 1610809381;
    function GetLevels(LevelType: CKL_Levels; var Denoms: WideString; var Levels: WideString): WordBool; dispid 1610809382;
    function ErrorManage(code: Integer; const Description: WideString; 
                         var Device_Available: WordBool): WordBool; dispid 1610809383;
    property UnikeID: WideString readonly dispid 1745027112;
    function PaySpecific(Amount: Integer; var PaidOutValue: Integer): WordBool; dispid 1610809388;
    property OnErrorDiscard: WordBool dispid 1073938478;
    property ShowDecimals: Byte readonly dispid 1745027118;
    property AmountFactor: Byte readonly dispid 1745027117;
  end;

// *********************************************************************//
// The Class CoEasyCashKeeper provides a Create and CreateRemote method to          
// create instances of the default interface _EasyCashKeeper exposed by              
// the CoClass EasyCashKeeper. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEasyCashKeeper = class
    class function Create: _EasyCashKeeper;
    class function CreateRemote(const MachineName: string): _EasyCashKeeper;
  end;

implementation

uses System.Win.ComObj;

class function CoEasyCashKeeper.Create: _EasyCashKeeper;
begin
  Result := CreateComObject(CLASS_EasyCashKeeper) as _EasyCashKeeper;
end;

class function CoEasyCashKeeper.CreateRemote(const MachineName: string): _EasyCashKeeper;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EasyCashKeeper) as _EasyCashKeeper;
end;

end.
