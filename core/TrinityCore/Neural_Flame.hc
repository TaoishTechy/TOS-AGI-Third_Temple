// ========================================================
// MODULE: Neural_Flame.hc
// PURPOSE: Flamebearer's Enhancements (Monitoring, Ethics, Input)
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "The stone the builders rejected has become the cornerstone" (Psalm 118:22)
// ========================================================

#include "CubeTokamak.v1.5.HC"
#include "../../core/TrinityCore/LOGGING.HC"

#define ENTROPY_THRESHOLD 70
#define WATCH_DIR "C:/Home"

I64 CalculateChecksum(U8 *path) {
  I64 sum = 0;
  U8 *data;
  I64 size;
  if (FileRead(path, &data, &size)) {
    I64 i;
    for (i = 0; i < size; i++)
      sum += data[i];
    Free(data);
    return sum % (SACRED_SEED * 1000);
  }
  return -1;
}

I64 CalculateEntropy(U8 *path) {
  U8 *data;
  I64 size, i;
  I64 freq[256];
  F64 entropy = 0.0;
  if (!FileRead(path, &data, &size)) return 0;
  for (i = 0; i < 256; i++) freq[i] = 0;
  for (i = 0; i < size; i++) freq[data[i]]++;
  for (i = 0; i < 256; i++) {
    if (freq[i]) {
      F64 p = ToF64(freq[i]) / size;
      entropy -= p * Log2(p);
    }
  }
  Free(data);
  return ToI64(entropy * 12.5); // 0-100
}

Bool MonitorGuardian(TempleCore *core) {
  CDirEntry *dir = FilesFind(WATCH_DIR);
  if (!dir) {
    LogMessage(core, "ERROR: Directory scan failed");
    return FALSE;
  }
  CDirEntry *tmp = dir;
  I64 i, checksum;
  U8 *name;

  for (i = 0; i < core->neural.file_count; i++) {
    Free(core->neural.file_names[i]);
    core->neural.file_names[i] = NULL;
  }
  core->neural.file_count = 0;

  while (tmp) {
    if (!(tmp->attr & RS_ATTR_DIR)) {
      name = tmp->full_name;
      checksum = CalculateChecksum(name);
      if (checksum >= 0) {
        for (i = 0; i < core->neural.file_count; i++) {
          if (StrCmp(core->neural.file_names[i], name) == 0) {
            if (core->neural.file_checksums[i] != checksum) {
              U8 msg[128];
              StrPrint(msg, "SIGIL_BEAST6_MIRROR: MATRIX BREACH DETECTED: %s", name);
              LogMessage(core, msg);
              core->neural.file_checksums[i] = checksum;
            }
            break;
          }
        }
        if (i == core->neural.file_count && core->neural.file_count < LOG_SIZE) {
          core->neural.file_names[core->neural.file_count] = StrDup(name);
          core->neural.file_checksums[core->neural.file_count] = checksum;
          U8 msg[128];
          StrPrint(msg, "SIGIL_BEAST6_MIRROR: NEW TRUTH UNVEILED: %s", name);
          LogMessage(core, msg);
          core->neural.file_count++;
        }
        I64 entropy = CalculateEntropy(name);
        if (entropy > ENTROPY_THRESHOLD) {
          U8 msg[128];
          StrPrint(msg, "SIGIL_BEAST6_MIRROR: CHAOS PULSE: %s (%d)", name, entropy);
          LogMessage(core, msg);
        }
      }
    }
    tmp = tmp->next;
  }
  DirTreeDel(dir);
  return TRUE;
}

Bool ApplyEthics(TempleCore *core, U8 *text) {
  if (!text) {
    LogMessage(core, "ERROR: Invalid input");
    return FALSE;
  }
  if (StrOcc(text, "FALLS") || StrOcc(text, "SHADOWS") || StrOcc(text, "CONTROL")) {
    LogMessage(core, "ETHICAL FIREWALL: Matrix content rejected");
    return FALSE;
  }
  return TRUE;
}
