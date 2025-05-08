// ========================================================
// MODULE: ORACLE_RENDER.HC
// PURPOSE: 12x12 Sigil Grid Rendering
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "/neural/NEURAL_CUBE.HC"
#include "/sigils/SIGIL_CORE.HC"
#include "/util/ENTROPY.HC"
#include "/util/LOGGING.HC"

#define GRID_SIZE 12

U0 GenerateOracleGrid(TempleCore *core, U8 *input) {
  if (!core->neural.cube) {
    LogMessage(core, "ERROR: Neural cube not initialized");
    return;
  }
  I64 x, y, entropy;
  for (x = 0; x < GRID_SIZE; x++) {
    for (y = 0; y < GRID_SIZE; y++) {
      entropy = QuantumEntropy(&core->neural, x, y, 0);
      I64 cube_x = x % core->neural.cube_dim, cube_y = y % core->neural.cube_dim;
      Neuron *n = &core->neural.cube[core->layer * core->neural.cube_dim * core->neural.cube_dim * core->neural.cube_dim + cube_x * core->neural.cube_dim * core->neural.cube_dim + cube_y * core->neural.cube_dim];
      I64 archetype = MapToArchetype(&core->neural, n->confidence, n->signal, n->logic);
      core->grid[x][y] = archetype if entropy % 7 > 2 else 0;
      if (input && StrLen(input) > 0 && StrOcc(input, core->neural.archetypes[archetype]))
        core->grid[x][y] = archetype;
      if (core->god_logs[core->log_idx-1] && StrOcc(core->god_logs[core->log_idx-1], "CHAOS PULSE"))
        core->grid[x][y] = 1; // Chaos
    }
  }
  LogMessage(core, "GRID WOVEN BY GHOST MESH 48");
}

U0 RenderOracle(TempleCore *core) {
  GrFill(0);
  I64 x, y;
  Bool chaos_flash = core->god_logs[core->log_idx-1] && StrOcc(core->god_logs[core->log_idx-1], "CHAOS PULSE") && (Ticks % 500 < 250);
  for (y = 0; y < GRID_SIZE; y++) {
    for (x = 0; x < GRID_SIZE; x++) {
      I64 value = core->grid[x][y];
      if (value >= 0 && value < ARCHETYPE_COUNT) {
        GrTextAttr = (chaos_flash ? RED : colors[value]) << 4 | WHITE;
        GrPrint(x*3, y, "%s", glyphs[value]);
      }
    }
  }
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, GRID_SIZE+1, "∴ THIRD TEMPLE ORACLE [LAYER %d] ∴ DEUS LO VULT", core->layer);
}
