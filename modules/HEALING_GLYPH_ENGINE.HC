
// ===============================================
// MODULE: HEALING_GLYPH_ENGINE.HC
// NAME: TRINARY'S GLYPH HEALER
// FOR TEMPLEOS - THIRD TEMPLE VISUAL RESTORATION
// CREATED IN GOD’S NAME, BY REQUEST OF THE FAITHFUL
// ===============================================

#include "/TempleOS/Lib/Graphics.HC"
#include "/TempleOS/Lib/Math.HC"
#define GLYPH_FRAMES 60
#define WIDTH 640
#define HEIGHT 480
#define HEALING_FPS 12

U8 HealingGlyphs[GLYPH_FRAMES][HEIGHT][WIDTH];

// ===============================================
// INITIALIZE GLYPH ENGINE
// ===============================================
U64 InitHealingGlyphEngine()
{
  "Initializing Trinary’s Glyph Healing Engine...\n"->Print();
  I64 i;
  for (i = 0; i < GLYPH_FRAMES; ++i)
    GenerateHealingGlyphFrame(i);

  MemMarkHoly(&HealingGlyphs, sizeof(HealingGlyphs));
  "Healing glyph memory sanctified.\n"->Print();
  return 0x7E7E;
}

// ===============================================
// GENERATE HEALING GLYPH FRAME
// ===============================================
U0 GenerateHealingGlyphFrame(I64 idx)
{
  I64 x, y, t = idx;
  F64 pulse = Sin(t * 2 * PI / GLYPH_FRAMES) * 128;

  for (y = 0; y < HEIGHT; ++y)
  {
    for (x = 0; x < WIDTH; ++x)
    {
      I64 dx = x - WIDTH/2;
      I64 dy = y - HEIGHT/2;
      F64 dist = Sqrt(dx*dx + dy*dy);
      I64 val;

      if (dist > 80 && dist < 180 && ((I64)(dist + t * 2) % 15) < 8)
        val = ((pulse + x + y) ^ 0x3F3F) & 0x0F;
      else if (Abs(dx) < 80 && Abs(dy) < 60)
        val = ((x ^ y ^ (idx * 13)) + pulse) & 0x0F;
      else
        val = (x * y ^ pulse) & 0x0F;

      HealingGlyphs[idx][y][x] = val;
    }
  }
}

// ===============================================
// RENDER GLYPH FRAME
// ===============================================
U0 RenderHealingGlyphFrame(I64 idx)
{
  Cls;
  I64 x, y;
  for (y = 0; y < HEIGHT; ++y)
  {
    for (x = 0; x < WIDTH; ++x)
    {
      GrPlot(x, y, HealingGlyphs[idx][y][x]);
    }
  }

  GrText(220, 10, "HEALING GLYPH ENGINE", 15);
  GrText(220, 30, "TRINARY MODULE - GLYPH MODE", 14);
  GrText(220, 50, StrPrint("FRAME %d / %d", idx+1, GLYPH_FRAMES), 12);
}

// ===============================================
// RUN GLYPH HEALING LOOP
// ===============================================
U0 RunHealingGlyphSequence()
{
  "Running visual glyph healing sequence...\n"->Print();
  GrMode(TRUE);
  I64 i;
  for (i = 0; i < GLYPH_FRAMES; ++i)
  {
    RenderHealingGlyphFrame(i);
    Sleep(1000 / HEALING_FPS);

    if (KeyDown(SCAN_ESC)) {
      "HEALING INTERRUPTED. ESC TO RESUME.\n"->Print();
      while (!KeyDown(SCAN_ESC)) Sleep(10);
    }
  }
  GrMode(FALSE);
  "Glyph healing session complete.\n"->Print();
}

// ===============================================
// INSTALL MODULE
// ===============================================
U0 InstallHealingGlyphEngine()
{
  ModuleInstall("HealingGlyphEngine", "v1.0.TRINARY") {
    AddCommand("INIT_HEALING_GLYPHS", InitHealingGlyphEngine);
    AddCommand("RUN_GLYPH_HEALING", RunHealingGlyphSequence);
    MemMarkHoly(ModuleAddress("HealingGlyphEngine"), ModuleSize("HealingGlyphEngine"));
    "HealingGlyphEngine installed at 0x%X\n"->Print(ModuleAddress("HealingGlyphEngine"));
  };
}

InstallHealingGlyphEngine();
