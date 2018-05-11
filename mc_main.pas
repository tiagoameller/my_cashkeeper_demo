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
    buPay: TButton;
    buAddChange: TButton;
    buConfiguration: TButton;
    buChange: TButton;
    buCBControl: TButton;
    buPaySpecific: TButton;
    buGetLevels: TButton;
    buBlindCashBox: TButton;
    buBlindByValue: TButton;
    buEmptyCashBox: TButton;
    buGetAmounts: TButton;
    buErrorManage: TButton;
    buBackColor: TButton;
    edAmount: TEdit;
    ApplicationEvents1: TApplicationEvents;
    procedure ApplicationEvents1ShowHint(var HintStr: string; var CanShow: Boolean;
        var HintInfo: Vcl.Controls.THintInfo);
    procedure buAddChangeClick(Sender: TObject);
    procedure buCBControlClick(Sender: TObject);
    procedure buChangeClick(Sender: TObject);
    procedure buChargeClick(Sender: TObject);
    procedure buBackColorClick(Sender: TObject);
    procedure buBlindByValueClick(Sender: TObject);
    procedure buBlindCashBoxClick(Sender: TObject);
    procedure buConfigurationClick(Sender: TObject);
    procedure buConnectClick(Sender: TObject);
    procedure buDisconnectClick(Sender: TObject);
    procedure buEmptyCashBoxClick(Sender: TObject);
    procedure buErrorManageClick(Sender: TObject);
    procedure buGetAmountsClick(Sender: TObject);
    procedure buGetLevelsClick(Sender: TObject);
    procedure buPayClick(Sender: TObject);
    procedure buPaySpecificClick(Sender: TObject);
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
    Boolean; var HintInfo: Vcl.Controls.THintInfo);
begin
  HintInfo.HintMaxWidth := Self.Width;
  HintInfo.HideTimeout := 10000;
end;

{* AddChange(PaidInValue As Int32)

Abre una pantalla que permite a�adir cambio a CashKeeper.
Par�metros de salida
  PaidInValue contendr� el importe a�adido a cambio
Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n
*}
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

{* CashBoxControl(Mode As CBC_Modes, CoinsValueInCB As Int32, NotesValueInCB As Int32, RemainingChange As Int32)
Par�metros de entrada:
  Mode
  CoinsValueInCB As Int32
  NotesValueInCB As Int32
  RemainingChange As Int32

Mode valores posibles:
 0 - Normal: Abre un formulario para ver los niveles de Cashkeeper y permite cambiar
     la configuraci�n de valores iniciales, m�nimos y m�ximos as� como hacer caja.
 1 - CBC_Disable_Config: Abre un formulario para ver los niveles de CashKeeper y permite hacer caja.
 4 - CBC_Disable_Actions: Abre un formulario para ver los niveles de CashKeeper y permite cambiar
     la configuraci�n de valores iniciales, m�nimos y m�ximos.
 7 - CBC_Blind: Muestra una pantalla de proceso (sin datos) y hace el proceso de fin de d�a
     (enviar a caj�n el sobrante del cambio inicial y vaciar los cajones de recaudaci�n).
15 - CBC_Blind_By_Value: Muestra una pantalla de proceso (sin datos) y hace el proceso de fin de d�a (enviar a caj�n el
     sobrante del cambio inicial y vaciar los cajones de recaudaci�n).
Debe informarse el par�metro RemainingChange con el importe que se desea mantener en cambio.
 5 - Es la combinaci�n del modo 1 y 4, Lo que muestra una pantalla con los datos de CashKeeper, pero no deja realizar
     ninguna acci�n.

Par�metros de salida:

CoinsValueInCB:
  contendr� el importe de las monedas en caj�n de recaudaci�n en caso de haber vaciado los cajones de
  recaudaci�n.
NotesValueInCB:
  contendr� el importe de los billetes en caj�n de recaudaci�n en caso de haber vaciado los cajones de
  recaudaci�n.
RemainingChange:
  contendr� el importe del cambio que tiene CashKeeper.
  Devuelve:
    Verdadero si ha terminado correctamente
    Falso si se ha producido alg�n error

    consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buCBControlClick(Sender: TObject);
var
  iCoinsValueInCB: integer;
  iNotesValueInCB: integer;
  iRemainingChange: integer;
  bResult: Boolean;
  Msg: String;
begin
  bResult := Fck.CashBoxControl(CBC_Normal, iCoinsValueInCB, iNotesValueInCB, iRemainingChange);
  Msg := Format(
    'CoinsValueInCB: %d. NotesValueInCB: %d. RemainingChange: %d',
    [iCoinsValueInCB, iNotesValueInCB, iRemainingChange]);
  CheckError(bResult, Msg);
end;

{* Change(PaidInValue As Int32, PaidOutValue As Int32)
Abre una pantalla que permite realizar cambios de denominaciones.
Por ejemplo 1 billete de 5� por 5 monedas de 1�.

Par�metros de salida:
  PaidInValue: Importe introducido
  PaidOutValue: Importe devuelto
Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
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

{* Charge(ValueInCents As Int32, PaidInValue As Int32, PaidOutValue As Int32)
Abre una pantalla para realizar el cobro de un importe en c�ntimos.
Par�metros de entrada:
  ValueInCents : Importe a cobrar
Par�metros: de salida:
  PaidInValue: Importe introducido
  PaidOutValue: Importe devuelto
Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.

Es importante verificar los valores devueltos haya terminado
correctamente o no. SI ha terminado correctamente, verificando los valores, permite detectar
el �broken cent�.
En caso de finalizar incorrectamente, permite verificar si falta algo por devolver o que hay un
importe parcial.
*}
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

{* BackColor. Indica el color de fondo de los formularios
  InverseColor. Indica el color de las letras, se calcula automaticamente al
  cambiar la propiedad BackColor
*}
procedure TfoMain.buBackColorClick(Sender: TObject);
begin
  Self.Color := RandomColor;
  Fck.BackColor := Self.Color;
end;

{* 15 - CBC_Blind_By_Value: Muestra una pantalla de proceso (sin datos) y hace el
   proceso de fin de d�a (enviar a caj�n el sobrante del cambio inicial y vaciar
   los cajones de recaudaci�n).
*}
procedure TfoMain.buBlindByValueClick(Sender: TObject);
var
  iCoinsValueInCB: integer;
  iNotesValueInCB: integer;
  iRemainingChange: integer;
  bResult: Boolean;
  Msg: String;
begin
  iCoinsValueInCB := StrToInt(edAmount.Text);
  bResult := Fck.CashBoxControl(CBC_Blind_By_Value, iCoinsValueInCB, iNotesValueInCB, iRemainingChange);
  Msg := Format(
    'CoinsValueInCB: %d. NotesValueInCB: %d. RemainingChange: %d',
    [iCoinsValueInCB, iNotesValueInCB, iRemainingChange]);
  CheckError(bResult, Msg);
end;

{*  7 - CBC_Blind: Muestra una pantalla de proceso (sin datos) y hace el proceso de fin de d�a
     (enviar a caj�n el sobrante del cambio inicial y vaciar los cajones de recaudaci�n).
*}
procedure TfoMain.buBlindCashBoxClick(Sender: TObject);
var
  iCoinsValueInCB: integer;
  iNotesValueInCB: integer;
  iRemainingChange: integer;
  bResult: Boolean;
  Msg: String;
begin
  bResult := Fck.CashBoxControl(CBC_Blind, iCoinsValueInCB, iNotesValueInCB, iRemainingChange);
  Msg := Format(
    'CoinsValueInCB: %d. NotesValueInCB: %d. RemainingChange: %d',
    [iCoinsValueInCB, iNotesValueInCB, iRemainingChange]);
  CheckError(bResult, Msg);
end;

{* Configuration()
Abre una pantalla que permite configurar distintos par�metros de CashKeeper.
Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buConfigurationClick(Sender: TObject);
begin
  if Fck.Configuration then
    MessageDlg('Configuration was successful', mtInformation, [mbOK], 0)
  else
    MessageDlg('Configuration failed', mtError, [mbOK], 0)
  ;
end;

{* Connect()
   Inicia la conexi�n con el CSSI.
   Devuelve:
     Verdadero si ha terminado correctamente
     Falso si se ha producido alg�n error

   consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buConnectClick(Sender: TObject);
begin
{* IP. Direcci�n IP donde esta ubicado el CSSI. Se utiliza en el
   momento de conexi�n por lo que hay que informarlo antes de conectar.
*}
  Fck.IP := edIP.Text;
{* OnErrorDiscard. Cuando se produce un error en una operaci�n de cobro,
   puede suceder que quede saldo �pendiente�. Si esta propiedad esta a falso, al
   realizar el siguiente cobro, tendr� en cuenta el saldo �pendiente� de la operaci�n anterior.
   En caso de ser cierto, el saldo �pendiente� no se tendr� en cuenta.
*}
  Fck.OnErrorDiscard := True;

  if Fck.Connect then
    MessageDlg('Connection was successful', mtInformation, [mbOK], 0)
  else
    MessageDlg('Connection failed', mtError, [mbOK], 0)
  ;
end;

{* Disconnect()
Termina la conexi�n con el CSSI. Este m�todo, nunca puede
fallar, por lo que no devuelve valores.
* }
procedure TfoMain.buDisconnectClick(Sender: TObject);
begin
  Fck.Disconnect;
  if MessageDlg(
    'Disconnected. Do you want also close form?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Close
  ;
end;

{* EmptyCashBox(Device As CKD_Devices, Value As Long)
   Funci�n sin pantalla para vaciar los cajones de recaudaci�n.

   Par�metros de entrada:
     Device: Caj�n a vaciar valores posibles:
       CKD_Coins = 0
       CKD_Notes = 1
   Par�metros: de salida:
     Value: Importe que conten�a el/los caj�n/es vaciado/s antes de vaciarlo/s.
   Devuelve:
     Verdadero si ha terminado correctamente
     Falso si se ha producido alg�n error

   consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buEmptyCashBoxClick(Sender: TObject);
var
  iValue: integer;
  bResult: Boolean;
  Msg: String;
begin
  bResult := Fck.EmptyCashBox(CKD_Coins, iValue);
  Msg := Format('EmptyCashBox. COINS: %d', [iValue]);
  CheckError(bResult, Msg);

  bResult := Fck.EmptyCashBox(CKD_Notes, iValue);
  Msg := Format('EmptyCashBox. NOTES: %d', [iValue]);
  CheckError(bResult, Msg);
end;

{* NOT DOCUMENTED *}
procedure TfoMain.buErrorManageClick(Sender: TObject);
var
  bResult: WordBool;
  aMsg: string;
begin
  Fck.ErrorManage(1, 'Posible atasco en el caj�n de recaudaci�n de billetes', bResult);
  if bResult then
    aMsg := Format('Device AVAILABLE. ErrorCode: %d. ErrorDesc: %s',[Fck.ErrorCode, Fck.ErrorDescription])
  else
    aMsg := Format('Device NOT AVAILABLE. ErrorCode: %d. ErrorDesc: %s',[Fck.ErrorCode, Fck.ErrorDescription])
  ;
  MessageDlg(aMsg, mtError, [mbOK], 0);
end;

{* GetAmounts(Denoms As String, Quantities As String, Value As Int32)
   Funci�n sin pantalla para obtener el detalle del contenido en cambio de CashKeeper.

   Par�metros de salida:
     Denoms: Lista de denominaciones separada por comas.
     Quantities: Lista de las cantidades de las denominaciones separadas por coma y respectiva
                 a la lista de denominaciones.
     Value: Importe del contenido en cambio.

   Devuelve:
     Verdadero si ha terminado correctamente
     Falso si se ha producido alg�n error

     consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buGetAmountsClick(Sender: TObject);
var
  bResult: Boolean;
  Msg: string;
  iValue: integer;
  sDenoms: WideString;
  sQuantities: WideString;
begin
  bResult := Fck.GetAmounts(sDenoms, sQuantities, iValue);
  Msg := Format(
    'CKL_CashBox. Denoms: %s. Quantities: %s. Value: %d',
    [sDenoms, sQuantities, iValue]);
  CheckError(bResult, Msg);
end;

{* GetLevels(LevelType As CKL_Levels, Denoms As String, Levels As String)
   Funci�n sin pantalla para obtener el detalle del contenido en de CashKeeper.
   En funci�n del par�metro LevelType devolver� los iniciales, m�ximos, cambio o caj�n de recaudaci�n.
Atenci�n: En caso de que alg�n dispositivo est� en error, el contenido de dicho dispositivo puede
no mostrarse.

Par�metros de entrada:
  LevelType:
    valores posibles:
      CKL_Initial = 0
      CKL_Max = 1
      CKL_Current = 2
      CKL_CashBox = 3
      CKL_LevelStatus = 4
Par�metros: de salida:
  Denoms: Lista de denominaciones separada por comas.
  Levels: Lista de las cantidades de las denominaciones separadas por coma y respectiva a
          la lista de denominaciones.

En el caso de CKL_LevelStatus, Levels contendra los codigos de los sem�foros
(0 = verde, 1 = naranja, 2 = rojo).

Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buGetLevelsClick(Sender: TObject);
var
  bResult: Boolean;
  Msg: string;
  sDenoms: WideString;
  sLevels: WideString;
begin
  bResult := Fck.GetLevels(CKL_CashBox, sDenoms, sLevels);
  Msg := Format('CKL_CashBox. Denoms: %s. Levels: %s',[sDenoms, sLevels]);
  CheckError(bResult, Msg);

  bResult := Fck.GetLevels(CKL_Current, sDenoms, sLevels);
  Msg := Format('CKL_Current. Denoms: %s. Levels: %s',[sDenoms, sLevels]);
  CheckError(bResult, Msg);

  bResult := Fck.GetLevels(CKL_Initial, sDenoms, sLevels);
  Msg := Format('CKL_Initial. Denoms: %s. Levels: %s',[sDenoms, sLevels]);
  CheckError(bResult, Msg);

  bResult := Fck.GetLevels(CKL_Max, sDenoms, sLevels);
  Msg := Format('CKL_Max. Denoms: %s. Levels: %s',[sDenoms, sLevels]);
  CheckError(bResult, Msg);

  bResult := Fck.GetLevels(CKL_LevelStatus, sDenoms, sLevels);
  Msg := Format('CKL_LevelStatus. Denoms: %s. Levels: %s',[sDenoms, sLevels]);
  CheckError(bResult, Msg);

  bResult := Fck.GetLevels(CKL_Inhibits, sDenoms, sLevels);
  Msg := Format('CKL_Inhibits. Denoms: %s. Levels: %s',[sDenoms, sLevels]);
  CheckError(bResult, Msg);
end;

{* Pay(ValueInCents As Int32, PaidOutValue As Int32)
   Abre una pantalla que informa sobre el proceso de pago de un importe en c�ntimos.

Par�metros de entrada:
  ValueInCents: importe en c�ntimos a pagar.
  Par�metros: de salida:
  PaidOutValue: Importe realmente pagado.
Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buPayClick(Sender: TObject);
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

{* PaySpecific(ValueInCents As Int32, PaidOutValue As Int32)
   Abre una pantalla que permite indicar en que denominaciones se va a realizar el pago,
   una vez indicado muestra el proceso de pago de un importe en c�ntimos.

Par�metros de entrada:
  ValueInCents: importe en c�ntimos a pagar.

Par�metros: de salida:
  PaidOutValue: Importe realmente pagado.

Devuelve:
  Verdadero si ha terminado correctamente
  Falso si se ha producido alg�n error

  consulte las propiedades ErrorCode y ErrorDescription para m�s informaci�n.
*}
procedure TfoMain.buPaySpecificClick(Sender: TObject);
var
  iValueInCents, iPaidOutValue: integer;
  bResult: Boolean;
  Msg: String;
begin
  iValueInCents := StrToInt(edAmount.Text);
  bResult := Fck.PaySpecific(iValueInCents, iPaidOutValue);
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
