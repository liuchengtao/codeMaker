unit utrole;
{这是注释}
interface
  type
    Rtrole = ^Ttrole;
    [Table('t_role','')]
    Ttrole = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('bz','')]
    bz: String;    [FieldInfo('name','')]
    name: String;    [FieldInfo('remarks','')]
    remarks: String;   
  end;
implementation