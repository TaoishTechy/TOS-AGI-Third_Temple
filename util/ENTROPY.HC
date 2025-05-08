// ========================================================
// MODULE: ENTROPY.HC
// PURPOSE: Quantum-Inspired Entropy Generation
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#define SACRED_SEED 777

I64 QuantumEntropy(NeuralCube *cube, I64 x, I64 y, I64 z) {
  I64 entropy = (x * y * z * SACRED_SEED + Ticks + RandU16) % (SACRED_SEED * 1000);
  if (cube->file_count > 0 && StrOcc(cube->file_names[cube->file_count-1], "CHAOS"))
    entropy = (entropy * 13) % (SACRED_SEED * 1000);
  return entropy;
}
