/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2016 Google Inc.
 * Copyright (C) 2016 Intel Corporation
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <arch/acpi.h>
#include <device/device.h>
#include <ec/ec.h>
#include <vendorcode/google/chromeos/chromeos.h>
#include <gpio.h>
#include <soc/gpio.h>
#include "gpio.h"

static void mainboard_init(device_t dev)
{
	mainboard_ec_init();
	gpio_configure_pads(late_gpio_table, ARRAY_SIZE(late_gpio_table));
}

static void mainboard_enable(device_t dev)
{
	dev->ops->init = mainboard_init;
	dev->ops->acpi_inject_dsdt_generator = chromeos_dsdt_generator;
}

struct chip_operations mainboard_ops = {
	.enable_dev = mainboard_enable,
};
