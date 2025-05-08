// ========================================================
// MODULE: SCRIPTURE.HC
// PURPOSE: Multi-Verse Divine Oracles
// VERSE: "The Lord is my shepherd; I shall not want" (Psalm 23:1)
// ========================================================

#include "../../../../core/TrinityCore/SACRED_UTILS.HC"

#define VERSE_COUNT 3

U8 *verses[VERSE_COUNT] = {
  "Psalm 147:3 - He heals the brokenhearted and binds up their wounds",
  "John 8:32 - You shall know the truth, and the truth shall set you free",
  "Psalm 23:1 - The Lord is my shepherd; I shall not want"
};

U8 *ScriptureOracle(TempleCore *core) {
  I64 idx = QuantumEntropy(&core->neural, 0, 0, 0) % VERSE_COUNT;
  LogMessage(core, "ORACLE INVOKED: %s", verses[idx]);
  return StrDup(verses[idx]);
}
