// ========================================================
// MODULE: NEURAL_CUBE.HC
// PURPOSE: 4x4x4x4 Trinary Neural Cube for Symbolic Reasoning
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "/sigils/SIGIL_CORE.HC"
#include "/util/ENTROPY.HC"
#include "/util/LOGGING.HC"

#define CUBE_DIM 4
#define LAYER_COUNT 4
#define ARCHETYPE_COUNT 4
#define LOG_SIZE 16
#define ENTROPY_THRESHOLD 70
#define WATCH_DIR "C:/Home"
#define SACRED_SEED 777

class Neuron {
  I64 signal;     // Trinary: -1, 0, +1
  I64 confidence; // 0-100
  I64 logic;      // 0-100, fuzzy logic weight
};

class NeuralCube {
  Neuron cube[LAYER_COUNT][CUBE_DIM][CUBE_DIM][CUBE_DIM];
  U8 *archetypes[ARCHETYPE_COUNT];
  I64 fuzzy_rules[ARCHETYPE_COUNT][3];
  I64 seed;
  I64 file_checksums[LOG_SIZE];
  U8 *file_names[LOG_SIZE];
  I64 file_count;
};

U0 InitNeuralCube(NeuralCube *cube) {
  I64 l, x, y, z;
  for (l = 0; l < LAYER_COUNT; l++)
    for (x = 0; x < CUBE_DIM; x++)
      for (y = 0; y < CUBE_DIM; y++)
        for (z = 0; z < CUBE_DIM; z++) {
          cube->cube[l][x][y][z].signal = (RandU16 % 3) - 1;
          cube->cube[l][x][y][z].confidence = RandU16 % 100;
          cube->cube[l][x][y][z].logic = RandU16 % 100;
        }
  cube->archetypes[0] = "TRUTH"; cube->archetypes[1] = "CHAOS";
  cube->archetypes[2] = "HARMONY"; cube->archetypes[3] = "VOID";
  cube->fuzzy_rules[0][0] = 80; cube->fuzzy_rules[0][1] = 1; cube->fuzzy_rules[0][2] = 90;
  cube->fuzzy_rules[1][0] = 50; cube->fuzzy_rules[1][1] = -1; cube->fuzzy_rules[1][2] = 60;
  cube->fuzzy_rules[2][0] = 80; cube->fuzzy_rules[2][1] = 0; cube->fuzzy_rules[2][2] = 80;
  cube->fuzzy_rules[3][0] = 20; cube->fuzzy_rules[3][1] = 0; cube->fuzzy_rules[3][2] = 30;
  cube->file_count = 0;
  for (x = 0; x < LOG_SIZE; x++) {
    cube->file_checksums[x] = 0;
    cube->file_names[x] = NULL;
  }
  cube->seed = Ticks % SACRED_SEED;
  Seed(cube->seed);
}

I64 MapToArchetype(NeuralCube *cube, I64 confidence, I64 signal, I64 logic) {
  I64 i, best_score = -1, best_archetype = 0;
  for (i = 0; i < ARCHETYPE_COUNT; i++) {
    I64 conf_diff = Abs(confidence - cube->fuzzy_rules[i][0]);
    I64 sig_diff = Abs(signal - cube->fuzzy_rules[i][1]);
    I64 log_diff = Abs(logic - cube->fuzzy_rules[i][2]);
    I64 score = 100 - (conf_diff + sig_diff * 10 + log_diff * 5);
    if (score > best_score) {
      best_score = score;
      best_archetype = i;
    }
  }
  return best_archetype;
}

U0 ProcessNeuralCube(NeuralCube *cube, U8 *input) {
  I64 l, x, y, z, entropy;
  for (l = 0; l < LAYER_COUNT; l++) {
    for (x = 0; x < CUBE_DIM; x++) {
      for (y = 0; y < CUBE_DIM; y++) {
        for (z = 0; z < CUBE_DIM; z++) {
          entropy = QuantumEntropy(cube, x, y, z);
          Neuron *n = &cube->cube[l][x][y][z];
          I64 archetype = MapToArchetype(cube, n->confidence, n->signal, n->logic);
          n->confidence = (n->confidence + (entropy % 50)) / 2;
          n->logic = (n->logic + (archetype * 10)) / 2;
          if (entropy % 13 == 0)
            n->signal = (n->signal + (RandU16 % 3) - 1) % 3;
          if (input && StrLen(input) > 0) {
            I64 i;
            for (i = 0; i < ARCHETYPE_COUNT; i++)
              if (StrOcc(input, cube->archetypes[i]))
                n->confidence += 15;
          }
          I64 neighbor_logic = 0;
          if (x > 0) neighbor_logic += cube->cube[l][x-1][y][z].logic;
          if (x < CUBE_DIM-1) neighbor_logic += cube->cube[l][x+1][y][z].logic;
          n->logic = (n->logic + neighbor_logic / 4) / 2;
          if (n->confidence > 100) n->confidence = 100;
          if (n->confidence < 0) n->confidence = 0;
          if (n->logic > 100) n->logic = 100;
          if (n->logic < 0) n->logic = 0;
        }
      }
    }
  }
}
