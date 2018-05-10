unit mc_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CKEasyV2_TLB, Vcl.StdCtrls, Vcl.AppEvnts;

type
  TfoMain = class(TForm)
    buConnect: TButton;
    buDisconnect: TButton;
    edIP: TEdit;
    buCharge: TButton;
    byPay: TButton;
    buAddChange: TButton;
    buConfiguration: TButton;
    buChange: TButton;
    buCBControl: TButton;
    buPaySpecific: TButton;
    buGetLevels: TButton;
    buBlidCashBox: TButton;
    buZByAmount: TButton;
    buEmptyCB: TButton;
    buGetAmounts: TButton;
    buErrorTest: TButton;
    buColor: TButton;
    edAmount: TEdit;
    ApplicationEvents1: TApplicationEvents;
    procedure ApplicationEvents1ShowHint(var HintStr: string; var CanShow: Boolean;
        var HintInfo: THintInfo);
    procedure buAddChangeClick(Sender: TObject);
    procedure buChangeClick(Sender: TObject);
    procedure buChargeClick(Sender: TObject);
    procedure buColorClick(Sender: TObject);
    procedure buConfigurationClick(Sender: TObject);
    procedure buConnectClick(Sender: TObject);
    procedure buDisconnectClick(Sender: TObject);
    procedure byPayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fck: EasyCashKeeper;
    procedure CheckError(bResult: Boolean; const sMsg: string);
    function RandomColor: TColor;
  end;

var
  foMain: TfoMain;

implementation

{$R *.dfm}

procedure TfoMain.ApplicationEvents1ShowHint(var HintStr: string; var CanShow:
    Boolean; var HintInfo: THintInfo);
begin
  HintInfo.HintMaxWidth := Self.Width;
  HintInfo.HideTimeout := 10000;
end;

procedure TfoMain.buAddChangeClick(Sender: TObject);
var
  iValueInCents: integer;
  bResult: Boolean;
  Msg: String;
begin
  iValueInCents := StrToInt(edAmount.Text);
  bResult := Fck.AddChange(iValueInCents);
  Msg := Format('AddedChange: %d',[iValueInCents]);
  CheckError(bResult, Msg);
end;

procedure TfoMain.buChangeClick(Sender: TObject);
var
  iPaidInValue, iPaidOutValue: integer;
  bResult: Boolean;
  Msg: String;
begin
  iPaidInValue := StrToInt(edAmount.Text);
  bResult := Fck.Change(iPaidInValue, iPaidOutValue);
  Msg := Format('Introduced: %d. Payed: %d',[iPaidInValue, iPaidOutValue]);
  CheckError(bResult, Msg);
end;

procedure TfoMain.buChargeClick(Sender: TObject);
var
  iValueInCents, iPaidInValue, iPaidOutValue: integer;
  bResult: Boolean;
  Msg: String;
begin
  iValueInCents := StrToInt(edAmount.Text);
  bResult := Fck.Charge(iValueInCents, iPaidInValue, iPaidOutValue);
  Msg := Format('PaidInValue: %d. PaidOutValue: %d',[iPaidInValue, iPaidOutValue]);
  CheckError(bResult, Msg);
end;

procedure TfoMain.buColorClick(Sender: TObject);
begin
  Self.Color := RandomColor;
  Fck.BackColor := Self.Color;
end;

procedure TfoMain.buConfigurationClick(Sender: TObject);
begin
  if Fck.Configuration then
    MessageDlg('Configuration was successful', mtInformation, [mbOK], 0)
  else
    MessageDlg('Configuration failed', mtError, [mbOK], 0)
  ;
end;

procedure TfoMain.buConnectClick(Sender: TObject);
begin
  Fck.IP := edIP.Text;
  if Fck.Connect then
    MessageDlg('Connection was successful', mtInformation, [mbOK], 0)
  else
    MessageDlg('Connection failed', mtError, [mbOK], 0)
  ;
end;

procedure TfoMain.buDisconnectClick(Sender: TObject);
begin
  Fck.Disconnect;
  if MessageDlg('Close?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Close
  ;
end;

procedure TfoMain.byPayClick(Sender: TObject);
var
  iValueInCents, iPaidOutValue: integer;
  bResult: Boolean;
  Msg: String;
begin
  iValueInCents := StrToInt(edAmount.Text);
  bResult := Fck.Pay(iValueInCents, iPaidOutValue);
  Msg := Format('PaidOutValue: %d',[iPaidOutValue]);
  CheckError(bResult, Msg);
end;

procedure TfoMain.CheckError(bResult: Boolean; const sMsg: string);
var
  aMsg: String;
  msgType: TMsgDlgType;
begin
  if bResult then
    msgType := mtInformation
  else
    msgType := mtError
  ;
  if Fck.ErrorCode > 0 then
    aMsg := sMsg + Format('. ErrorCode: %d. ErrorDesc: %s',[Fck.ErrorCode, Fck.ErrorDescription])
  else
    aMsg := sMsg
  ;
  MessageDlg(aMsg, msgType, [mbOK], 0);
end;

procedure TfoMain.FormCreate(Sender: TObject);
begin
  Fck := CoEasyCashKeeper.Create;
end;

function TfoMain.RandomColor: TColor;
const
  COLORS: array[0..StandardColorsCount - 1] of TColor = (
    clBlack,
    clMaroon,
    clGreen,
    clOlive,
    clNavy,
    clPurple,
    clTeal,
    clGray,
    clSilver,
    clRed,
    clLime,
    clYellow,
    clBlue,
    clFuchsia,
    clAqua,
    clLtGray
  );
begin
  Result := COLORS[Random(StandardColorsCount - 1)];
end;

end.
