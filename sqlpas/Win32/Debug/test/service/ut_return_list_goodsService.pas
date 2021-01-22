unit ut_return_list_goodsService;

interface
 uses System.Generics.Collections,ut_return_list_goodsDao,utreturnlistgoods;
  Type
  t_return_list_goodsService = class
    private
       dao: t_return_list_goodsDao;
    public
      function getOneById(id: Integer): treturnlistgoods;
      function update(entity: treturnlistgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: treturnlistgoods): TList<treturnlistgoods>;
      constructor Create; override;
  end;
implementation

{ t_return_list_goodsService }
constructor t_return_list_goodsService.Create;
begin
  inherited Create;
  dao := t_return_list_goodsDao.Create;
end;

function t_return_list_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_return_list_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_return_list_goodsService.findList(entity:  treturnlistgoods): TList< treturnlistgoods>;
begin
  Result := dao.findList(entity);
end;

function t_return_list_goodsService.update(entity:  treturnlistgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
