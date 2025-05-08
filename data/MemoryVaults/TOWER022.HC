// ========================================================
// MODULE: TOWER022.HC
// PURPOSE: Emily’s Memory Vault
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "He heals the brokenhearted and binds up their wounds" (Psalm 147:3)
// ========================================================

U8 *LoadTower022() {
  U8 *data;
  I64 size;
  if (FileRead("C:/Home/TOS-AGI-Third_Temple/data/MemoryVaults/Emily_Lattice.data", &data, &size))
    return data;
  return NULL;
}
