NAME := board_lpcxpresso54018

$(NAME)_MBINS_TYPE := kernel
$(NAME)_VERSION    := 1.0.1
$(NAME)_SUMMARY    := configuration for board lpcxpresso54018

MODULE          := 54018
HOST_ARCH       := Cortex-M4
HOST_MCU_FAMILY := mcu_lpc54018impl

$(NAME)_COMPONENTS += $(HOST_MCU_FAMILY) kernel_init network

CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_LPC54018
CONFIG_SYSINFO_DEVICE_NAME   := LPC54018

GLOBAL_DEFINES += SKIP_SYSCLK_INIT
GLOBAL_DEFINES += STDIO_UART=0
GLOBAL_DEFINES += CLI_CONFIG_STACK_SIZE=8192

GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"
GLOBAL_CFLAGS += -DSYSINFO_ARCH=\"$(HOST_ARCH)\"
GLOBAL_CFLAGS += -DSYSINFO_MCU=\"$(HOST_MCU_FAMILY)\"
GLOBAL_CFLAGS += -DCPU_LPC54018JET180

GLOBAL_INCLUDES += .

$(NAME)_SOURCES :=
$(NAME)_SOURCES += ./board.c
$(NAME)_SOURCES += ./clock_config.c
$(NAME)_SOURCES += ./pin_mux.c

TEST_COMPONENTS += certificate_test

GLOBAL_CFLAGS += -DTEST_CONFIG_KV_ENABLED=0
GLOBAL_CFLAGS += -DTEST_CONFIG_YLOOP_ENABLED=1

# Keil project support
$(NAME)_KEIL_VENDOR = NXP
$(NAME)_KEIL_DEVICE = LPC54018JET180

