/*
 * This file is part of the coreboot project.
 *
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include <acpi/acpi.h>
#include "variant/ec.h"
#include "variant/gpio.h"

DefinitionBlock(
	"dsdt.aml",
	"DSDT",
	0x02,		// DSDT revision: ACPI v2.0 and up
	OEM_ID,
	ACPI_TABLE_CREATOR,
	0x20110725	// OEM revision
)
{
	#include <soc/intel/tigerlake/acpi/platform.asl>

	// global NVS and variables
	#include <soc/intel/common/block/acpi/acpi/globalnvs.asl>

	// CPU
	#include <cpu/intel/common/acpi/cpu.asl>

	Scope (\_SB) {
		Device (PCI0)
		{
			#include <soc/intel/common/block/acpi/acpi/northbridge.asl>
			#include <soc/intel/tigerlake/acpi/southbridge.asl>
			#include <soc/intel/tigerlake/acpi/tcss.asl>
		}
		/* Mainboard hooks */
		#include "mainboard.asl"
	}

	// Chrome OS specific
	#include <vendorcode/google/chromeos/acpi/chromeos.asl>

	/* Include Low power idle table for a short term workaround to enable
	   S0ix. Once cr50 pulse width is fixed, this can be removed. */
	#include <soc/intel/common/acpi/lpit.asl>

	// Chrome OS Embedded Controller
	Scope (\_SB.PCI0.LPCB)
	{
		// ACPI code for EC SuperIO functions
		#include <ec/google/chromeec/acpi/superio.asl>
		// ACPI code for EC functions
		#include <ec/google/chromeec/acpi/ec.asl>
	}

	#include <southbridge/intel/common/acpi/sleepstates.asl>

#if CONFIG(VARIANT_HAS_MIPI_CAMERA)
	/* Camera */
	#include <soc/intel/tigerlake/acpi/ipu.asl>
	#include <variant/acpi/mipi_camera.asl>
#endif /* VARIANT_HAS_MIPI_CAMERA */
}
