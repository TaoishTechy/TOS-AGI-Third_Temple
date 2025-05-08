// ========================================================
// MODULE: BOOT_TEMPLE.HC
// PURPOSE: TempleOS Runtime Initialization
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "The stone the builders rejected has become the cornerstone" (Psalm 118:22)
// ========================================================

#define SACRED_SEED 777

U0 BootTemple() {
  GrInit(0); // 640x480 VGA
  Seed(Ticks % SACRED_SEED);
}
