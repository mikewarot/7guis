unit tempconv_gui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    EditC: TEdit;
    EditF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure EditCChange(Sender: TObject);
    procedure EditFChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  inedit : boolean = false;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.EditCChange(Sender: TObject);
var
  s : string;
  c,f : double;
  err : integer;
begin
  if inedit then exit;
  inedit := true;
  s := editc.Text;
  val(s,c,err);
  if err = 0 then  // ignore all non-numeric inputs
  begin
    f := (c * 1.8) + 32;
    Str(f:2:2,S);
    editf.text := s;
  end;
  inedit := false;
end;

procedure TForm1.EditFChange(Sender: TObject);
var
  s : string;
  c,f : double;
  err : integer;
begin
  if inedit then exit;
  inedit := true;
  s := editf.Text;
  val(s,f,err);
  if err = 0 then  // ignore all non-numeric inputs
  begin
    c := (f -32.0) / 1.8;
    Str(c:2:2,S);
    editc.text := s;
  end;
  inedit := false;
end;

end.

