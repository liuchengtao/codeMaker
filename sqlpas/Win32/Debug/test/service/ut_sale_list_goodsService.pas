unit ut_sale_list_goodsService;

interface
 uses System.Generics.Collections,ut_sale_list_goodsDao,utsalelistgoods;
  Type
  t_sale_list_goodsService = class
    private
       dao: t_sale_list_goodsDao;
    public
      function getOneById(id: Integer): tsalelistgoods;
      function update(entity: tsalelistgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tsalelistgoods): TList<tsalelistgoods>;
      constructor Create; override;
  end;
implementation

{ t_sale_list_goodsService }
constructor t_sale_list_goodsService.Create;
begin
  inherited Create;
  dao := t_sale_list_goodsDao.Create;
end;

function t_sale_list_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_sale_list_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_sale_list_goodsService.findList(entity:  tsalelistgoods): TList< tsalelistgoods>;
begin
  Result := dao.findList(entity);
end;

function t_sale_list_goodsService.update(entity:  tsalelistgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
