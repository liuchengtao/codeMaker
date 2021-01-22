unit {ServiceUnitName};

interface
 uses System.Generics.Collections,{DaoUnitName},{EntityUnitName};
  Type
  {ServiceName} = class
    private
       dao: {DaoName};
    public
      function getOneById(id: Integer): {EntityName};
      function update(entity: {EntityName}): Integer;
      function deleteById(id: Integer): Integer;
      function findList(entity: {EntityName}): TList<{EntityName}>;
      constructor Create; override;
  end;
implementation

{ {ServiceName} }
constructor TService.Create;
begin
  inherited Create;
  dao := {DaoName}.Create;
end;

function TService.deleteById(id: Integer): Integer;
begin
  Result := dao.deleteById(id);
end;

function TService.getOneById(id: Integer): RTest;
begin
  Result := dao.getOneById(id);
end;

function TService.findList(entity:  {EntityName}): TList< {EntityName}>;
begin
  Result := dao.findList(entity);
end;

function TService.update(entity:  {EntityName}): Integer;
begin
  Result := dao.update(enity);
end;

end.
