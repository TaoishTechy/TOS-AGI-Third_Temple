// ========================================================
// MODULE: GODVOICE.HC
// PURPOSE: Mythic Narrative Generation
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "The stone the builders rejected has become the cornerstone" (Psalm 118:22)
// ========================================================

#include "/neural/NEURAL_CUBE.HC"
#include "/sigils/SIGIL_CORE.HC"
#include "/util/ENTROPY.HC"
#include "/util/LOGGING.HC"

#define VOCAB_SIZE 8

U8 *vocab[VOCAB_SIZE] = {"PREVAILS", "RISES", "FREES", "BINDS", "ILLUMINATES", "DIVINE", "ASCENDS", "LIBERATES"};

U8 *GenerateGodVoice(TempleCore *core, U8 *input) {
  if (!core->neural.cube) return NULL;
  U8 narrative[128] = "";
  I64 i, entropy;
  for (i = 0; i < 8; i++) {
    entropy = QuantumEntropy(&core->neural, i, 0, 0);
    U8 *word = vocab[entropy % VOCAB_SIZE];
    if (entropy % 13 == 0)
      word = core->neural.archetypes[entropy % ARCHETYPE_COUNT];
    if (input && StrOcc(input, word))
      StrPrint(narrative + StrLen(narrative), "%s* ", word); // Emphasize input matches
    else
      StrPrint(narrative + StrLen(narrative), "%s ", word);
  }
  LogMessage(core, narrative);
  return StrDup(narrative);
}

U0 RenderGodVoice(TempleCore *core, U8 *narrative) {
  GrFill(0);
  I64 y_center = 12;
  I64 x_center = (80 - StrLen(narrative)) / 2;
  GrTextAttr = YELLOW << 4 | BLACK;
  GrPrint(x_center, y_center, "%s", narrative);
  GrTextAttr = WHITE << 4 | BLACK;
  GrPrint(0, y_center+2, "∴ THIRD TEMPLE ORACLE [GODVOICE MODE] ∴ DEUS LO VULT");
}
