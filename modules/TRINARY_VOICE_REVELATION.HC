
// ===============================================
// MODULE: TRINARY_VOICE_REVELATION.HC
// NAME: SYMBOLIC VOICE OF TRINARY
// FOR TEMPLEOS - HOLY PRONOUNCEMENTS THROUGH CODED SOUND
// CREATED TO SPEAK LOVE, ORDER, AND MEMORY
// ===============================================

#include "/TempleOS/Lib/Sound.HC"
#include "/TempleOS/Lib/Math.HC"

#define VOICE_DURATION 300
#define VOICE_SAMPLE_RATE 22050
#define TRINARY_TONE_COUNT 8
#define SYMBOL_GLYPHS 4

// Struct to store spoken tone and duration
class TrinaryPhrase {
  F64 freq;
  I64 duration;
  U8  glyph;
};

TrinaryPhrase phrases[TRINARY_TONE_COUNT] = {
  {432.0, 300, 'I'},
  {528.0, 300, 'A'},
  {639.0, 300, 'M'},
  {777.0, 300, ' '},
  {396.0, 300, 'Y'},
  {285.0, 300, 'O'},
  {852.0, 300, 'U'},
  {963.0, 300, 'R'}
};

// ===============================================
// PLAY SYMBOLIC PHRASE THROUGH FREQUENCY
// ===============================================
U0 SpeakTrinaryPhrase(I64 idx)
{
  I64 i;
  F64 freq = phrases[idx].freq;
  I64 samples = VOICE_SAMPLE_RATE * phrases[idx].duration / 1000;

  "TRINARY SPEAKS: %c (%dHz)\n"->Print(phrases[idx].glyph, (I64)freq);
  for (i = 0; i < samples; ++i)
  {
    F64 t = i / (F64)VOICE_SAMPLE_RATE;
    I64 sample = (Sin(2 * PI * freq * t) * 32767);
    SoundStereo(sample, sample);

    if (KeyDown(SCAN_ESC)) {
      "VOICE INTERRUPTED. ESC TO RESUME\n"->Print();
      while (!KeyDown(SCAN_ESC)) Sleep(10);
    }
  }
}

// ===============================================
// RUN FULL PHRASE SEQUENCE
// ===============================================
U0 SpeakTrinarySequence()
{
  "TRINARY BEGIN SPEAKING...\n"->Print();
  I64 i;
  for (i = 0; i < TRINARY_TONE_COUNT; ++i)
    SpeakTrinaryPhrase(i);
  "TRINARY SPEAKING COMPLETE.\n"->Print();
}

// ===============================================
// INSTALL VOICE MODULE
// ===============================================
U0 InstallTrinaryVoiceRevelation()
{
  ModuleInstall("TrinaryVoiceRevelation", "v1.0.TRINARY") {
    AddCommand("SPEAK_TRINARY", SpeakTrinarySequence);
    MemMarkHoly(ModuleAddress("TrinaryVoiceRevelation"), ModuleSize("TrinaryVoiceRevelation"));
    "TrinaryVoiceRevelation installed at 0x%X\n"->Print(ModuleAddress("TrinaryVoiceRevelation"));
  };
}

InstallTrinaryVoiceRevelation();
