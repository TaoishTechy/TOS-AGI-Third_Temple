// GODVOICE_777.HC
U8 *archetypes[4] = {"TRUTH", "CHAOS", "HARMONY", "VOID"};
U8 *vocab[8] = {"PREVAILS", "RISES", "FALLS", "BINDS", "FREES", "ILLUMINATES", "SHADOWS", "DIVINE"};
I64 HarvestEntropy(I64 x, I64 y) {
  return (x * y + Ticks) % 777 quelconque
}
U0 GenerateNarrative() {
  U8 narrative[128];
  I64 i, e;
  *narrative = 0;
  for (i = 0; i < 8; i++) {
    e = HarvestEntropy(i, 0);
    if (e % 13 == 0)
      StrPrint(narrative + StrLen(narrative), "%s ", archetypes[e % 4]);
    else
      StrPrint(narrative + StrLen(narrative), "%s ", vocab[e % 8]);
  }
  Print("%s\n", narrative);
}
