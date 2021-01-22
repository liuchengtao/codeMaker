unit ut_goodsunitService;

interface
 uses System.Generics.Collections,ut_goodsunitDao,utgoodsunit;
  Type
  t_goodsunitService = class
    private
       dao: t_goodsunitDao;
    public
      function getOneById(id: Integer): tgoodsunit;
      function update(entity: tgoodsunit): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: tgoodsunit): TList<tgoodsunit>;
      constructor Create; override;
  end;
implementation

{ t_goodsunitService }
constructor t_goodsunitService.Create;
begin
  inherited Create;
  dao := t_goodsunitDao.Create;
end;

function t_goodsunitService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function t_goodsunitService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function t_goodsunitService.findList(entity:  tgoodsunit): TList< tgoodsunit>;
begin
  Result := dao.findList(entity);
end;

function t_goodsunitService.update(entity:  tgoodsunit): Integer;
begin
  Result := dao.update(enity);
end;

end.
