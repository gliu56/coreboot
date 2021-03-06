/* SPDX-License-Identifier: GPL-2.0-only */
/* This file is part of the coreboot project. */

#include <acpi/acpi.h>
#include <soc/southbridge.h>
#include <amdblocks/acpimmio.h>
#include <security/vboot/vboot_common.h>
#include <security/vboot/vbnv.h>
#include <pc80/mc146818rtc.h>

int vbnv_cmos_failed(void)
{
	/* If CMOS power has failed, the century will be set to 0xff */
	return cmos_read(RTC_CLK_ALTCENTURY) == 0xff;
}
