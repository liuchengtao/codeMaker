unit uBaseDao;

interface
  uses  System.SysUtils, System.Rtti, System.TypInfo, System.Generics.Collections,FireDAC.Comp.Client;
  type
  // RczSort = ^TczSort;
   TczSort = class         //����
      FFieldName: String;
      FSort: String;
    end;

    TczPage = Record    //��ҳ
      FPageNum: Integer;
      FPageCount: Integer;
    end;

    TTest = Record
      id: Integer;
      name: String;
      age: Integer;
      bz: String;
      address: String;
    End;
  TczBaseDao<T> = class
    private

    public
    function adds(entity: TczSort): Integer;
    function add(Aitem: TObject): Integer;
    function delete(Aitem: T): Integer;
    function update(Aitem: T): Integer;
    function find(Aitem: T): TList<T>;    overload;
    function find(Aitem: T; sort: TczSort;page: TczPage): TList<T>;   overload;
   // constructor Create;
  end;
implementation

{ TczBaseDao }


{ TczBaseDao<T> }

function TczBaseDao<T>.add(Aitem: TObject): Integer;
var
  ctx: TRttiContext;
  t: TRttiType;
  m,vRttiField: TRttiField;
  sName,vFieldName: String;
  vTypeKind : TTypeKind;
  s: TRttiRecordType;
begin
   vTypeKind := GetTypeKind(Aitem);
   ctx := TRttiContext.Create;
   t := ctx.GetType((aitem as TObject).ClassType);
  // t := ctx.GetType(aitem.ClassType);
   for vRttiField in t.AsRecord.GetFields do
   begin
      sName := vRttiField.Name;
   end;

end;

function TczBaseDao<T>.adds(entity: TczSort): Integer;
var query: TFDQuery;
begin
  //
//  query := TFDQuery.Create(nil);
//  Try
//    with query do
//    begin
//      Connection := nil;
//      SQL.Text := 'select * from table limit 1';
//      Open;
//      Append;
//      FieldByName().AsVariant := entity.FFieldName;
//      FieldByName('').AsVariant := entity.FSort;
//      Post;
//      Close;
//      Free;
//    end;
//  Except
//    Result
//  End;
end;

function TczBaseDao<T>.delete(Aitem: T): Integer;
begin

end;

function TczBaseDao<T>.find(Aitem: T): TList<T>;
begin

end;

function TczBaseDao<T>.find(Aitem: T; sort: TczSort; page: TczPage): TList<T>;
begin

end;

function TczBaseDao<T>.update(Aitem: T): Integer;
begin

end;

end.
