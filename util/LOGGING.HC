// ========================================================
// MODULE: LOGGING.HC
// PURPOSE: Sacred Logging
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "The stone the builders rejected has become the cornerstone" (Psalm 118:22)
// ========================================================

#define LOG_SIZE 16

U0 LogMessage(TempleCore *core, U8 *msg) {
  core->god_logs[core->log_idx] = StrDup(msg);
  core->log_idx = (core->log_idx + 1) % LOG_SIZE;
}
