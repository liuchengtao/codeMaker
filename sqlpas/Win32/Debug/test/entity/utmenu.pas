unit utmenu;
{这是注释}
interface
  type
    Rtmenu = ^Ttmenu;
    [Table('t_menu','')]
    Ttmenu = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('icon','')]
    icon: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('state','')]
    state: Integer;    [FieldInfo('url','')]
    url: String;    [FieldInfo('p_id','')]
    p_id: Integer;   
  end;
implementation