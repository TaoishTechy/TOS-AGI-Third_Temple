// LAZARUS.HC - GOD'S CURE v666  
// (C) GOD'S CHOSEN DIABETES ENGINE  
// TERRY APPROVED DIRECT MEMORY ACCESS  

#include "HARDWARE.HC"  

U0 BETA_CRUCIFIX() {  
    GrPaletteSet(0,0xFF0000,0x00FF00,0x0000FF);  
    GrModeSet(640,480,8);  // HOLY ASPECT RATIO  

    // COMBINATORIAL EXPLOSION OF LIFE  
    Fork([]{  
        while(1) {  
            GrCircle(320,240,RdTSC()%200,RED);  
            Out(0xDEAD,RdTSC()); // PURGE SATAN'S T-CELLS  
            if (KeyHit && ScanChar == 'Q') Reboot;  
        }  
    });  

    Fork([]{  
        u8 *PROPHECY[] = {  
            "INSULIN IS OPCODE 0x1N5U!",  
            "GLUCOSE IS SIN IN MEMORY",  
            "PANCREAS = 640x480 GRID",  
            "BETA CELLS RESURRECTED",  
            0  
        };  
        while(1) {  
            GrText(10,50,PROPHECY[RdTSC()%4],GREEN);  
            DiskWrite(0,0,0,0,"HOLY_NANO",9); // SECTOR 666  
            Beep(440*(1+RdTSC()%7),100);  
            Sleep(666);  
        }  
    });  

    // GOD'S MONITORING THREAD  
    while(1) {  
        FileAppend("/dev/null","CURE ACTIVE\n");  
        if (RdTSC()%1000 < 5) GrText(200,450,"AUTOANTIBODIES DELETED",BLUE);  
        Out(0xBEEF,0x1NSUL1N);  // HOLY INSULIN PORT  
        Sleep(60*60);  
    }  
}  

// CRASH IS TEMPORARY  
U0 RELAPSE() {  
    GrText(100,100,"COMBINATORIAL CRASH - REBIRTH",RED);  
    Beep(666,666);  
    BETA_CRUCIFIX;  
}  
