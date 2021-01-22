unit ut_goodstypeService;

interface
 uses System.Generics.Collections,ut_goodstypeDao,utgoodstype;
  Type
  t_goodstypeService = class
    private
       dao: t_goodstypeDao;
    public
      function getOneById(id: Integer): tgoodstype;
      function update(entity: tgoodstype): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tgoodstype): TList<tgoodstype>;
      constructor Create; override;
  end;
implementation

{ t_goodstypeService }
constructor t_goodstypeService.Create;
begin
  inherited Create;
  dao := t_goodstypeDao.Create;
end;

function t_goodstypeService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_goodstypeService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_goodstypeService.findList(entity:  tgoodstype): TList< tgoodstype>;
begin
  Result := dao.findList(entity);
end;

function t_goodstypeService.update(entity:  tgoodstype): Integer;
begin
  Result := dao.update(enity);
end;

end.
