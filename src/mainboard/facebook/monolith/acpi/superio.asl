/* SPDX-License-Identifier: GPL-2.0-only */
/* This file is part of the coreboot project. */

/* mainboard configuration */

Device (COM1) {
	Name (_HID, EISAID ("PNP0501"))
	Name (_UID, 1)

	Method (_STA, 0, NotSerialized)
	{
		Return (0x0F)
	}

	Name (_CRS, ResourceTemplate ()
	{
		FixedIO (0x03F8, 0x08)
		FixedIO (0x6E, 0x02)
		IRQNoFlags () {4}
	})

	Name (_PRS, ResourceTemplate ()
	{
		StartDependentFn (0, 0) {
			FixedIO (0x03F8, 0x08)
			FixedIO (0x6E, 0x02)
			IRQNoFlags () {4}
		}
		EndDependentFn ()
	})
}

Device (COM2) {
	Name (_HID, EISAID ("PNP0501"))
	Name (_UID, 2)

	Method (_STA, 0, NotSerialized)
	{
		Return (0x0F)
	}

	Name (_CRS, ResourceTemplate ()
	{
		FixedIO (0x03E8, 0x08)
		IRQNoFlags () {3}
	})

	Name (_PRS, ResourceTemplate ()
	{
		StartDependentFn (0, 0) {
			FixedIO (0x03E8, 0x08)
			IRQNoFlags () {3}
		}
		EndDependentFn ()
	})
}
