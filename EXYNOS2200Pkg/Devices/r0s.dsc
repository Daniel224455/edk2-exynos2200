[Defines]
  PLATFORM_NAME                  = EXYNOS2200Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = EXYNOS2200Pkg/EXYNOS2200Pkg.fdf

!include EXYNOS2200Pkg/EXYNOS2200Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x90000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x90000000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x90001000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEXYNOS2200PkgTokenSpaceGuid.PcdCpuVectorBaseAddress|0x90000000
  gEXYNOS2200PkgTokenSpaceGuid.PcdUefiMemPoolBase|0x90241000         # DXE Heap base address
  gEXYNOS2200PkgTokenSpaceGuid.PcdUefiMemPoolSize|0x03C00000         # UefiMemorySize, DXE heap size

  # Framebuffer
  gEXYNOS2200PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0xF6200000
  gEXYNOS2200PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gEXYNOS2200PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2340
  gEXYNOS2200PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|1080
  gEXYNOS2200PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|2340

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2340
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2340