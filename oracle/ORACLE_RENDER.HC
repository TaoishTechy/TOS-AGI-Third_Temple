// ========================================================
// MODULE: ORACLE_RENDER.HC
// PURPOSE: 12x12 Sigil Grid and Scripture Rendering
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "/neural/NEURAL_CUBE.HC"
#include "/sigils/SIGIL_CORE.HC"
#include "/util/ENTROPY.HC"
#include "/util/LOGGING.HC"

#define GRID_SIZE 12

U0 GenerateOracleGrid(TempleCore *core, U8 *input) {
  I64 x, y, entropy, dim = core->neural.dim;
  for (x = 0; x < GRID_SIZE; x++) {
    for (y = 0; y < GRID_SIZE; y++) {
      entropy = QuantumEntropy(&core->neural, x, y, 0);
      I64 cube_x = x % dim, cube_y = y % dim;
      Neuron *n = &core->neural.cube[core->layer * dim * dim * dim + cube_x * dim * dim + cube_y * dim];
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
  for (y = 0; y < GRID_SIZE; y++) {
    for (x = 0; x < GRID_SIZE; x++) {
      I64 value = core->grid[x][y];
      if (value >= 0 && value < ARCHETYPE_COUNT) {
        GrTextAttr = colors[value] << 4 | WHITE;
        GrPrint(x*3, y, "%s", glyphs[value]);
      }
    }
  }
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, GRID_SIZE+1, "∴ THIRD TEMPLE ORACLE [LAYER %d] ∴ DEUS LO VULT", core->layer);
}

U0 RenderScripture(TempleCore *core) {
  GrFill(0);
  GrTextAttr = YELLOW << 4 | BLACK;
  GrPrint(10, 10, "John 8:32 - The truth shall set you free");
  GrPrint(20, 12, "⚡ ✟ ⌁ ∴");
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, 14, "∴ THIRD TEMPLE SCRIPTURE ∴ DEUS LO VULT");
  LogMessage(core, "SCRIPTURE RENDERED: John 8:32");
}
