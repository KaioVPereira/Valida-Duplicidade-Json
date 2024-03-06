unit JsonRepetido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, system.JSON, Vcl.ExtDlgs, Vcl.StdCtrls;

type
  Tfrm_Principal = class(TForm)
    OpenTextFileDialog1: TOpenTextFileDialog;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure MostraCodigoRepetido (JsonArray : TJSONArray);
    procedure FormCreate(Sender: TObject);
  private

    ConteudoArray : TJSONArray;
    ConteudoArquivo: TStringList;
    ConteudoJSON: TJSONObject;
    CaminhoArquivo: string;
    JsonContaItens : TJSONValue;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

uses
  System.Generics.Collections;

{$R *.dfm}

procedure Tfrm_Principal.Button1Click(Sender: TObject);
  var
  codigoExterno : String;
  I : INTEGER;
begin
  Memo1.Clear;
  Memo2.Clear;
  OpenTextFileDialog1 := TOpenTextFileDialog.Create(nil);
  ConteudoArquivo := TStringList.Create;
  ConteudoJSON := TJSONObject.Create;
  ConteudoArray := TJSONArray.Create;
  JsonContaItens  := TJSONValue.Create;

  if OpenTextFileDialog1.Execute() then
  begin
    CaminhoArquivo := OpenTextFileDialog1.FileName;

    ConteudoArquivo.LoadFromFile(CaminhoArquivo);

    ConteudoJSON := TJSONObject.ParseJSONValue(ConteudoArquivo.Text) as TJSONObject;
    ConteudoArray := ConteudoJSON.GetValue('data') as TJSONArray;

    //ShowMessage(ConteudoArray.ToString);

    MostraCodigoRepetido(ConteudoArray);

    for I := 0 to ConteudoArray.Count - 1 do
    begin
      JsonContaItens := ConteudoArray.Items[I];
      codigoExterno := JsonContaItens.GetValue<string>('codigoExterno');
      Memo1.Lines.Add(codigoExterno);

    end;




  end;
end;

procedure Tfrm_Principal.FormCreate(Sender: TObject);
begin
Memo1.Clear;
Memo2.Clear;
end;

procedure Tfrm_Principal.MostraCodigoRepetido(JsonArray: TJSONArray);
var
  codigoExternoCount: TDictionary<string, Integer>;
  jsonValue : TJSONValue;
  codigoExterno: string;
begin
  // Inicializar o dicionário para contar as ocorrências de cada código externo
  codigoExternoCount := TDictionary<string, Integer>.Create;

  try
    // Percorrer o array
    for jsonValue in jsonArray do
    begin
      // Certificar-se de que é um objeto JSON
      if jsonValue is TJSONObject then
      begin
        // Obter o valor do campo "codigoExterno"
        codigoExterno := TJSONObject(jsonValue).GetValue('codigoExterno').Value;

        // Incrementar a contagem para o código externo no dicionário
        if codigoExternoCount.ContainsKey(codigoExterno) then
          codigoExternoCount[codigoExterno] := codigoExternoCount[codigoExterno] + 1
        else
          codigoExternoCount.Add(codigoExterno, 1);
      end;
    end;

    // Mostrar os códigos externos que se repetem mais de uma vez
    for codigoExterno in codigoExternoCount.Keys do
    begin
      if codigoExternoCount[codigoExterno] > 1 then
        Memo2.Lines.Add('Código Externo Repetido: ' + codigoExterno);
    end;
  finally
    codigoExternoCount.Free;
  end;
end;

end.
