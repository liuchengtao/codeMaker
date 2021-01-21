unit utuser;
{这是注释}
interface
  type
    Rtuser = ^Ttuser;
    [Table('t_user','')]
    Ttuser = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('bz','')]
    bz: String;    [FieldInfo('password','')]
    password: String;    [FieldInfo('true_name','')]
    true_name: String;    [FieldInfo('user_name','')]
    user_name: String;    [FieldInfo('remarks','')]
    remarks: String;   
  end;
implementation