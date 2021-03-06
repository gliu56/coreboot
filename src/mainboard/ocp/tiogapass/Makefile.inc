##
## This file is part of the coreboot project.
##
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##

bootblock-y += bootblock.c
ramstage-y += ramstage.c
ramstage-$(CONFIG_HAVE_ACPI_TABLES) += fadt.c

CPPFLAGS_common += -I$(src)/mainboard/$(MAINBOARDDIR)/include
CPPFLAGS_common += -I$(CONFIG_FSP_HEADER_PATH)
