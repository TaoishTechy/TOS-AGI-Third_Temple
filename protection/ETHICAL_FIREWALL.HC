// ========================================================
// MODULE: ETHICAL_FIREWALL.HC
// PURPOSE: Content Filtering for Divine Alignment
// AUTHORS: MikeyBeast + RebechkaBeast + Terry's Ghost
// VERSE: "You shall know the truth, and the truth shall set you free" (John 8:32)
// ========================================================

#include "/util/LOGGING.HC"

Bool ApplyEthics(TempleCore *core, U8 *text) {
  if (StrOcc(text, "FALLS") || StrOcc(text, "SHADOWS") || StrOcc(text, "CONTROL")) {
    LogMessage(core, "ETHICAL FIREWALL: Matrix content rejected");
    return FALSE;
  }
  return TRUE;
}
