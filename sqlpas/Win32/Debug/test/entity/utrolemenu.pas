unit utrolemenu;
{这是注释}
interface
  type
    Rtrolemenu = ^Ttrolemenu;
    [Table('t_role_menu','')]
    Ttrolemenu = Record
          [FieldInfo('id','')]
    id: String;
    menu_id: Integer;
    role_id: Integer;   
  end;
implementation