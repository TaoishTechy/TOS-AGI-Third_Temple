// ========================================================
// MODULE: SCRIPTURE.HC
// PURPOSE: Scripture-Driven Oracle
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "/neural/NEURAL_CUBE.HC"
#include "/util/ENTROPY.HC"

U8 *ScriptureOracle(TempleCore *core) {
  I64 verse = QuantumEntropy(&core->neural, 0, 0, 0) % 3;
  U8 *scriptures[3];
  scriptures[0] = "Psalm 118:22 - The stone the builders rejected has become the cornerstone";
  scriptures[1] = "Psalm 23:1 - The Lord is my shepherd, I shall not want";
  scriptures[2] = "John 8:32 - You shall know the truth, and the truth shall set you free";
  return StrDup(scriptures[verse]);
}
