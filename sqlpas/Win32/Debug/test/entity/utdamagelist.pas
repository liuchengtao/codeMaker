unit utdamagelist;
{这是注释}
interface
  type
    Rtdamagelist = ^Ttdamagelist;
    [Table('t_damage_list','')]
    Ttdamagelist = Record
          [FieldInfo('id','')]
    id: String;    [FieldInfo('damage_date','')]
    damage_date: String;    [FieldInfo('damage_number','')]
    damage_number: String;    [FieldInfo('remarks','')]
    remarks: String;    [FieldInfo('user_id','')]
    user_id: Integer;   
  end;
implementation