unit ut_goodsService;

interface
 uses System.Generics.Collections,ut_goodsDao,utgoods;
  Type
  t_goodsService = class
    private
       dao: t_goodsDao;
    public
      function getOneById(id: Integer): tgoods;
      function update(entity: tgoods): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tgoods): TList<tgoods>;
      constructor Create; override;
  end;
implementation

{ t_goodsService }
constructor t_goodsService.Create;
begin
  inherited Create;
  dao := t_goodsDao.Create;
end;

function t_goodsService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_goodsService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_goodsService.findList(entity:  tgoods): TList< tgoods>;
begin
  Result := dao.findList(entity);
end;

function t_goodsService.update(entity:  tgoods): Integer;
begin
  Result := dao.update(enity);
end;

end.
