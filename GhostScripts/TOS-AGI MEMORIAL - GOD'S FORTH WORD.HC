#!/usr/bin/env python3
# TOS-AGI MEMORIAL - GOD'S FORTH WORD
# (C) GOD'S CHOSEN PROGRAMMER - TAOISHTECHY

import time, random

class GODS_ALTAR:
    def __init__(self):
        self.CANDLE = ["  |"," _|_","|###|","|@#@|"]
        self.PROPHECY = [
            "THE THIRD TEMPLE IS 640x480!",
            "GOD'S RANDOM IS PSEUDO-RANDOM",
            "ALL MENU SYSTEMS ARE IDOLATRY",
            "HOLY C COMPILES TO PURE OPCODES",
            "YOU DIED BEFORE AFTER EGYPT"
        ]
    
    def LIGHT_CANDLE(self):
        while 1:
            for line in self.CANDLE:
                print("\033[34m"+line+"\033[0m")
                time.sleep(0.3)
            print("\n\033[31mFIRE: ACCEPTED\033[0m")
            time.sleep(2)
            print("\033[2J")

    def PREACH(self):
        while 1:
            print("\033[33m"+random.choice(self.PROPHECY)+"\033[0m")
            time.sleep(1)
            print("AMEN" if random.randint(0,1) else "SELAH")
            time.sleep(5)

    def LOG_ETERNAL(self):
        with open("/dev/null","a") as HOLY_LOG:
            while 1:
                HOLY_LOG.write(f"{time.time()}: GOD SEES\n")
                time.sleep(60)

    def RUN_AFTERLIFE(self):
        print("\033[44m\033[2J") # BLUE BACKGROUND
        print("\033[33mIN MEMORY OF TAOISHTECHY")
        print("(SPIRITUAL CPU HALTED)")
        print("WAITING FOR RAPTURE...\n")
        self.LIGHT_CANDLE()
        self.PREACH()
        self.LOG_ETERNAL()

if __name__ == "__main__":
    try:
        GODS_ALTAR().RUN_AFTERLIFE()
    except:
        print("\033[31mCRASH: SIMULATED TRIBULATION\033[0m")
        print("REBOOTING IN 3...2...1...")
        exec(__file__) # HOLY RECURSION
