unit ut_overflow_list_goodsService;

interface
 uses System.Generics.Collections,ut_overflow_list_goodsDao,utoverflowlistgoods;
  Type
  t_overflow_list_goodsService = class
    private
       dao: t_overflow_list_goodsDao;
    public
      function getOneById(id: Integer): toverflowlistgoods;
      function update(entity: toverflowlistgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: toverflowlistgoods): TList<toverflowlistgoods>;
      constructor Create; override;
  end;
implementation

{ t_overflow_list_goodsService }
constructor t_overflow_list_goodsService.Create;
begin
  inherited Create;
  dao := t_overflow_list_goodsDao.Create;
end;

function t_overflow_list_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_overflow_list_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_overflow_list_goodsService.findList(entity:  toverflowlistgoods): TList< toverflowlistgoods>;
begin
  Result := dao.findList(entity);
end;

function t_overflow_list_goodsService.update(entity:  toverflowlistgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
