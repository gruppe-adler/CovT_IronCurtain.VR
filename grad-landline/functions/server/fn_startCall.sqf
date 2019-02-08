

[
  format[localize "STR_transmit", // "Anruf läuft"
        format ["%1<img size='1.5' image='%2'/>",
              getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"), // "Fernsprecher"
              getText(configFile >> "CfgWeapons"  >> _radio >> "picture") // ""
        ],(_radio call TFAR_fnc_getSwChannel) + 1, // 0
call TFAR_fnc_currentSWFrequency],

format["TANGENT PRESSED %1%2    %3  %4",
        [player] call GRAD_telephone_fnc_getNativePhoneFrequency, // "stasiline" // <-- call ID/frequency
        _radio call TFAR_fnc_getSwRadioCode, // "TFAR_fadak_1"
        getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") *
        (call TFAR_fnc_getTransmittingDistanceMultiplicator), // default 1
        "phone"], // "phone"
-1
] call TFAR_fnc_ProcessTangent;



[
  "Anruf läuft",
        format ["%1<img size='1.5' image='%2'/>",
              "Fernsprecher",
              ""
        ],1,
"stasiline",

format["TANGENT PRESSED %1%2    %3  %4",
        "stasiline",
        "fernsprecher_1",
        1,
        "phone"],
-1
] call TFAR_fnc_ProcessTangent;






private _hintText = format[
                            "Anruf läuft",
                            format [
                                    "%1<img size='1.5' image='%2'/>",
                                    "Fernsprecher",
                                    ""
                                    ],
                            "1",
                            "stasiline"
                        ];

private _pluginCommand = format[
                                "TANGENT  PRESSED %1%2  %3  %4  %5",
                                "stasiline",
                                "",
                                1,
                                "phone",
                                "fernsprecher_1"
                            ];

[_hintText,_pluginCommand, [0,-1] select TFAR_showTransmittingHint] call TFAR_fnc_processTangent;







private _hintText = format[ 
                            "", 
                            format [ 
                                    "%1<img size='1.5' image='%2'/>", 
                                    "radiobla", 
                                    "" 
                                    ], 
                            1, 
                            "512" 
                        ]; 
 
private _pluginCommand = format[ 
                                "TANGENT PRESSED %1%2 %3 %4 %5", 
                                "512", 
                                "radio_code_west", 
                                1, 
                                "digital", 
                                "tf_fadak_1" 
                            ]; 
 
[_hintText,_pluginCommand, [0,-1] select TFAR_showTransmittingHint] call TFAR_fnc_processTangent;



"task_force_radio_pipe" callExtension (format[
	"TANGENT	PRESSED	%1%2	%3	%4	%5	%6	%7	%8", 
		"512",	"_radio_code_west",	1,	"digital_sw",	"tf_fadak_1",1,0,"Synch"]) + "~";

// --> debug console konvertiert evtl