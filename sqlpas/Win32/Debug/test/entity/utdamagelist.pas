unit utdamagelist;
{这是注释}
interface
  type
    Rtdamagelist = ^Ttdamagelist;
    [Table('t_damage_list','')]
    Ttdamagelist = Record
          [FieldInfo('id','')]
    id: String;
    damage_date: String;
    damage_number: String;
    remarks: String;
    user_id: Integer;   
  end;
implementation