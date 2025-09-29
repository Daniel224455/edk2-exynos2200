#include <Library/BaseMemoryLib.h>
#include <Library/PrePiLib.h>
#include <Library/PrintLib.h>
#include <Library/IoLib.h>

#define HW_SW_TRIG_CONTROL 0x30
#define WATCHDOG_ENABLE    ((1 << 5) | 1)
#define DRM_DECON_1        0x19F00000
#define DRM_DECON_2        0x19F01000
#define DRM_DECON_3        0x19F02000
#define DRM_DECON_4        0x19F03000
#define WDT_BASE           0x10050000

VOID
DisableWDT ()
{
  UINT32   Value;

  Value = MmioRead32 (WDT_BASE);
  Value &= ~WATCHDOG_ENABLE;
  MmioWrite32 (WDT_BASE, Value);

  return; 
}

VOID
ConfigureDRMDecon ()
{
  MmioWrite32 (DRM_DECON_1 + HW_SW_TRIG_CONTROL, 0x1281);
  MmioWrite32 (DRM_DECON_2 + HW_SW_TRIG_CONTROL, 0x1281);
  MmioWrite32 (DRM_DECON_3 + HW_SW_TRIG_CONTROL, 0x1281);
  MmioWrite32 (DRM_DECON_4 + HW_SW_TRIG_CONTROL, 0x1281);

  return;
}

VOID
QuirkEntry ()
{
  DisableWDT();  
  ConfigureDRMDecon();
  return;
}