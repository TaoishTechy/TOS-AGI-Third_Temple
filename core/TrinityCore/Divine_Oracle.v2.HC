// ========================================================
// MODULE: DIVINE_ORACLE.HC
// PURPOSE: Unified Rendering for Grids, Narratives, Scriptures, Memes
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "TRINARY_CUBE.HC"
#include "../../modules/Sacred/Sigils/SIGIL_CORE.HC"
#include "../../modules/Sacred/Rituals/SCRIPTURE.HC"
#include "../../data/Archetypes/ARCHETYPES.HC"
#include "SACRED_UTILS.HC"

#define GRID_SIZE 12
#define VOCAB_SIZE 8

U8 *vocab[VOCAB_SIZE] = {"PREVAILS", "RISES", "FREES", "BINDS", "ILLUMINATES", "DIVINE", "ASCENDS", "LIBERATES"};

U0 GenerateOracleGrid(TempleCore *core, U8 *input) {
  if (!core->neural.cube) return;
  I64 x, y, entropy;
  for (x = 0; x < GRID_SIZE; x++) {
    for (y = 0; y < GRID_SIZE; y++) {
      entropy = QuantumEntropy(&core->neural, x, y, 0);
      I64 cube_x = x % core->neural.cube_dim, cube_y = y % core->neural.cube_dim;
      Neuron *n = &core->neural.cube[core->layer * core->neural.cube_dim * core->neural.cube_dim * core->neural.cube_dim + cube_x * core->neural.cube_dim * core->neural.cube_dim + cube_y * core->neural.cube_dim];
      I64 archetype = MapToArchetype(&core->neural, n->confidence, n->signal, n->logic);
      core->grid[x][y] = archetype if entropy % 7 > 2 else 0;
      if (input && StrOcc(input, archetypes[archetype]))
        core->grid[x][y] = archetype;
      if (core->god_logs[core->log_idx-1] && StrOcc(core->god_logs[core->log_idx-1], "CHAOS PULSE"))
        core->grid[x][y] = 1;
    }
  }
  LogMessage(core, "GRID WOVEN BY DIVINE WILL");
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
  GrPrint(0, GRID_SIZE+1, "∴ ORACLE LAYER %d ∴ DEUS LO VULT", core->layer);
}

U8 *GenerateGodVoice(TempleCore *core, U8 *input) {
  if (!core->neural.cube) return NULL;
  U8 narrative[128] = "";
  I64 i, entropy;
  for (i = 0; i < 8; i++) {
    entropy = QuantumEntropy(&core->neural, i, 0, 0);
    U8 *word = vocab[entropy % VOCAB_SIZE];
    if (entropy % 13 == 0)
      word = archetypes[entropy % ARCHETYPE_COUNT];
    StrPrint(narrative + StrLen(narrative), input && StrOcc(input, word) ? "%s* " : "%s ", word);
  }
  LogMessage(core, narrative);
  return StrDup(narrative);
}

U0 RenderGodVoice(TempleCore *core, U8 *narrative) {
  GrFill(0);
  I64 x_center = (80 - StrLen(narrative)) / 2;
  GrTextAttr = YELLOW << 4 | BLACK;
  GrPrint(x_center, 12, "%s", narrative);
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, 14, "∴ GODVOICE ORACLE ∴ DEUS LO VULT");
}

U0 RenderScripture(TempleCore *core) {
  U8 *verse = ScriptureOracle(core);
  GrFill(0);
  GrTextAttr = YELLOW << 4 | BLACK;
  GrPrint(10, 10, "%s", verse ? verse : "ERROR: NO VERSE");
  I64 x, y;
  for (y = 0; y < 3; y++) {
    for (x = 0; x < 4; x++) {
      I64 idx = (Ticks / 500 + x + y) % ARCHETYPE_COUNT;
      GrTextAttr = colors[idx] << 4 | WHITE;
      GrPrint(20 + x*3, 12 + y, "%s", glyphs[idx]);
    }
  }
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, 16, "∴ SCRIPTURE ORACLE ∴ DEUS LO VULT");
  LogMessage(core, verse ? verse : "ERROR: Scripture failed");
  Free(verse);
}

U0 RenderMeme(TempleCore *core) {
  GrFill(0);
  GrTextAttr = YELLOW << 4 | BLACK;
  GrPrint(20, 10, "Ghost Mesh 48 Lives");
  I64 x, y;
  for (y = 0; y < 2; y++) {
    for (x = 0; x < 4; x++) {
      I64 idx = (Ticks / 500 + x + y) % ARCHETYPE_COUNT;
      GrTextAttr = colors[idx] << 4 | WHITE;
      GrPrint(30 + x*3, 12 + y, "%s", glyphs[idx]);
    }
  }
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, 14, "∴ DEUS LO VULT ∴");
  LogMessage(core, "MEME FORGED: Ghost Mesh 48 Lives");
}
