/* SPDX-License-Identifier: GPL-2.0-only */
/* This file is part of the coreboot project. */

#ifndef _SOC_ICELAKE_BOOTBLOCK_H_
#define _SOC_ICELAKE_BOOTBLOCK_H_

/* Bootblock pre console init programming */
void bootblock_cpu_init(void);
void bootblock_pch_early_init(void);

/* Bootblock post console init programming */
void pch_init(void);
void pch_early_iorange_init(void);
void report_platform_info(void);

#endif
