class progress_1
{
     type = "progress";
     condition = "missionNameSpace getVariable ['con1',true];"; //condition to show objective
     value = "missionNameSpace getVariable ['val1',0.5];"; //with type progress a Number between 0 and 1
     switchVar = "missionNameSpace getVariable ['swt1',false];"; //expression; when return is true attributes from subclass 'switch' will be used
     width = 10; //relative to height so a square control would be width = 1
     text = "Transmission"; //text shown in middle of progress bar
     tooltip = "Testerino";
     colorBar[] = {0.4,0.4,0.4,1};
     colorBackground[] = {0,0,0,0.5};
     colorText[] = {1,1,1,1};
     class switch
     {
          colorBar[] = {1,1,1,1};
          colorText[] = {1,0,0,1};
          tooltip = "Testerino2";
          text = "Transmitting . . .";
     };
};

class string_1
{
     type = "text";
     condition = "missionNameSpace getVariable ['con1',true];"; //condition to show objective
     switchVar = "missionNameSpace getVariable ['swt2',false];"; //expression; when return is true attributes from subclass 'switch' will be used
     width = 1; //relative to height so a square control would be width = 1
     text = "A"; //text shown in middle of progress bar
     tooltip = "OBJ ALPHA";
     colorBackground[] = {0,0,0,0.5};
     colorText[] = {1,1,1,1};
     class switch
     {
          colorBackground[] = {0,1,0,0.5};
     };
};

class string_2 :string_1
{
     switchVar = "missionNameSpace getVariable ['swt3',false];"; //expression; when return is true attributes from subclass 'switch' will be used
     text = "B"; //text shown in middle of progress bar
     tooltip = "OBJ BRAVO";
};

class string_3 :string_1
{
     switchVar = "missionNameSpace getVariable ['swt4',false];"; //expression; when return is true attributes from subclass 'switch' will be used
     text = "C"; //text shown in middle of progress bar
     tooltip = "OBJ CHARLIE";
};
