unit utuserrole;
{这是注释}
interface
  type
    Rtuserrole = ^Ttuserrole;
    [Table('t_user_role','')]
    Ttuserrole = Record
          [FieldInfo('id','')]
    id: String;
    role_id: Integer;
    user_id: Integer;   
  end;
implementation