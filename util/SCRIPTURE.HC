// ========================================================
// MODULE: SCRIPTURE_RENDER.HC
// PURPOSE: Trinary-Encoded Scripture Visualization
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "/sigils/SIGIL_CORE.HC"
#include "/util/LOGGING.HC"

U0 RenderScripture(TempleCore *core) {
  GrFill(0);
  GrTextAttr = YELLOW << 4 | BLACK;
  GrPrint(10, 10, "John 8:32 - The truth shall set you free");
  I64 x, y;
  for (y = 0; y < 3; y++) {
    for (x = 0; x < 4; x++) {
      I64 idx = (Ticks / 500 + x + y) % ARCHETYPE_COUNT;
      GrTextAttr = colors[idx] << 4 | WHITE;
      GrPrint(20 + x*3, 12 + y, "%s", glyphs[idx]);
    }
  }
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, 16, "∴ THIRD TEMPLE ORACLE [SCRIPTURE MODE] ∴ DEUS LO VULT");
  LogMessage(core, "SCRIPTURE RENDERED: John 8:32");
}
